require 'ruby2d'
set title: "Paint",background: 'white', width: 456, height: 500
chosen_color="black"
erase_color="white"
color_list=['red','orange','yellow','green','blue','#EE82EE','black','#808080','white']
draw_size=10
def create_color_buttons()
  Rectangle.new(x:5,y:450,width:45,height:45,color:'red',z:1)
  Rectangle.new(x:55,y:450,width:45,height:45,color:'orange',z:1)
  Rectangle.new(x:105,y:450,width:45,height:45,color:'yellow',z:1)
  Rectangle.new(x:155,y:450,width:45,height:45,color:'green',z:1)
  Rectangle.new(x:205,y:450,width:45,height:45,color:'blue',z:1)
  Rectangle.new(x:255,y:450,width:45,height:45,color:'#EE82EE',z:1)
  Rectangle.new(x:305,y:450,width:45,height:45,color:'black',z:1)
  Rectangle.new(x:355,y:450,width:45,height:45,color:'#808080',z:1)
  Rectangle.new(x:405,y:450,width:45,height:45,color:'white',z:1)

end
def create_border()
  Rectangle.new(x:430,y:0,width:25,height:500,color:"#d6d4d3",z:1)
  Rectangle.new(x:0,y:0,width:55,height:500,color:"#d6d4d3",z:1)
  Rectangle.new(x:0,y:445,width:460,height:55,color:"#d6d4d3",z:1)
  Rectangle.new(x:0,y:20,width:500,height:25,color:"#d6d4d3",z:1)
end
def create_extra_buttons()
  Rectangle.new(x:5,y:50,width:40,height:40,color:"white",z:1)
  Rectangle.new(x:16,y:66,width:18,height:9,color:"#ff7eec",z:1)
  Rectangle.new(x:5,y:100,width:40,height:40,color:"white",z:1)
  Rectangle.new(x:14,y:110,width:21,height:25,color:'#808080',z:1)
  Rectangle.new(x:14,y:110,width:21,height:5,color:'blue',z:1)
  Rectangle.new(x:5,y:150,width:40,height:40,color:"white",z:1)
  Triangle.new(x1:15,x2:35,x3:25,y1:180,y2:180,y3:160,color:"black",z:1)
  Rectangle.new(x:5,y:200,width:40,height:40,color:"white",z:1)
  Triangle.new(x1:15,x2:35,x3:25,y1:210,y2:210,y3:230,color:"black",z:1)
end
create_border()
create_color_buttons()
create_extra_buttons()
on :mouse_down  do |event|
  if event.x>50 && event.x<400 && event.y>15 && event.y<445
    Circle.new(x:event.x,y:event.y,radius:draw_size,color:chosen_color,z:1)
    create_border()
    create_color_buttons()
    create_extra_buttons()
  end
  if event.y>450
    chosen_color=color_list[(event.x/50).floor()]
  end
  if event.x>0 && event.x<45 && event.y>25 && event.y<70
    chosen_color=erase_color
  end
  if event.x>0 && event.x<45 && event.y>80 && event.y<125
    Rectangle.new(x:0,y:0,width:435,height:500,color:chosen_color,z:0)
    create_border()
    create_color_buttons()
    create_extra_buttons()
    erase_color=chosen_color
  end
  if event.x>0 && event.x<45 && event.y>135 && event.y<175
    draw_size*=1.2
  end
  if event.x>0 && event.x<45 && event.y>190 && event.y<230
    draw_size*=0.8
  end
end
show
