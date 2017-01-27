defmodule Shelftalkers.PdfGenerator do
  alias Shelftalkers.Repo
  alias Shelftalkers.Talker
  import Ecto.Query, only: [from: 2]

  @headerHTML "<div style='width:208mm; height:272.6mm; padding-left: 0mm;border-top: 1px solid #000000; border-left: 1px solid #000000; border-right: 1px solid #000000; border-top: 1px solid #000000;' ></div>"
  @headerHTML2 "<div style='display:flex;justify-content:space-between'> <div>item A</div> <div>item B</div></div>"
  @headerHTML3 "<div style='height:10mm'></div>"

  def pdf_generator(selections) do
    ids = selections 
#    ids = "1,3,4,5,6" 
      |> String.split(",") 
      |> Enum.map(&(String.to_integer &1)) 

    talkers = from(t in Talker, where: t.id in ^ids) |> Repo.all 

    # break talkers up in to tuples of two for each row
    # set each row to 100% 

    selectionHTML = talkers 
      |> generate_card_row
#      |> Enum.join(" ")
    IO.puts(selectionHTML)

    {:ok, filename} = PdfGenerator.generate     "<html style='margin-left:0mm'> #{@headerHTML3} #{selectionHTML} </html>", 
      page_size: "Letter", 
      shell_params: ["--margin-left", "0", "--margin-right", "0", "--margin-top", "0", "--margin-bottom", "0", "--enable-smart-shrinking"]

    {:ok, filename}
  end

  def generate_card_row([left_talker, right_talker | tail]= talkers) do
    IO.puts("generate_card_row2")
    "<div style='width:100%;height:136.7mm;display:table;'> 
      <div style='width:45%;float:left;height:135mm;margin-right:5mm;'> #{generate_card(left_talker)} </div>
      <div style='width:45%;float:left;height:135mm;'> #{generate_card(right_talker)} </div>
     </div>
     #{generate_card_row(tail)}"
  end

  def generate_card_row([left_talker | tail] = talkers) do
    "<div style='width:100%;height:136.7mm;display:table'> 
      <div style='width:45%;float:left;height:135mm;margin-right:5mm;'> #{generate_card(left_talker)} </div>
      <div style='width:45%;float:left;height:135mm;'> </div>
     </div>
     #{generate_card_row(tail)}"
  end

  def generate_card_row([] = t) do
    nil
  end

  def generate_card(talker) do
    "<div style='position:relative;height:68mm;border:1px dashed black;'>
       <div style='padding:2mm 5mm';>
         <h1 style='font-size:1.2em;padding:0;margin:1mm 0;text-align:center'>#{talker.name} </h1>
         <div style='font-size:0.8em'>Brewer: #{talker.brewer}</div>
         <div style='font-size:0.8em'>Style: #{talker.style}</div>
         <div style='font-size:0.6em;margin:2mm 0mm;'><strong>Description</strong>: #{talker.description}</div>
         <div style='position:absolute;font-size:0.7em;bottom:2mm;right:12mm'>
           <span>ABV:<strong> #{talker.abv}</strong></span><span style='margin-left:4mm'>Rate Beer: <strong>#{talker.rating}</strong></span>
         </div>
       </div>
     </div>"

  end

end
