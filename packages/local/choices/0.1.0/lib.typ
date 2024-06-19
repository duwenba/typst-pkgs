

#let choice(
    content,
    number-style: "1.",
    number-align: alignment.left,
    opt-style   : "A.",
    space       : 8pt,
    options     : (:),
    ans         : (),
    show-ans    : true,
) = {
  let arr = (:);let opts = (:);
  let l = 0;

  if not show-ans {
    ans = ()
  }

  for e in content.children {
    if (e.has("body")) {
      l += 1;
      let op = 0;
      // 有选项
      if e.body.has("children") {
        let option = (:)

        arr.insert(str(numbering(number-style,l)),e.body.children.at(0))
        for opt in e.body.children {
          // 提取选项
          if opt.has("body") {
            op += 1;
            option.insert(str(numbering(opt-style,op)),opt.body)
          }
        }
        opts.insert(str(numbering(number-style,l)),option)
      } else { // 无选项
        arr.insert(str(numbering(number-style,l)),e.body)
        opts.insert(str(numbering(number-style,l)),(:))
      }
      
    }
  }



let xuanxiang = (:)
for i in opts.keys() {
  
  let t = grid(
      columns      : 2,
      align        : (left,left),
      column-gutter: 8pt,
      row-gutter   : 0.8em,

      ..opts.at(i).values().map(grid.cell.with(x:1)),
      ..opts.at(i).keys().map(grid.cell.with(x:0)),
    )

  xuanxiang.insert(i,t)
}


let timu(n:"1.") = {
  let t = grid(
    columns   : 2,
    row-gutter: 0em,
    grid.cell(arr.at(n),colspan: 2,y:0),

    if not xuanxiang.at(n).children == () {
      // grid.cell(arr.at(n),colspan: 2,y:0);
      grid.cell(pad(xuanxiang.at(n),y: 1em),colspan: 2);
    } else {
    }
  
  )
  return t
}

let problems = for i in arr.keys() {
  timu(n:i)
}
grid(
    columns      : (auto,1fr,auto,1em-2*space,auto),
    align        : (left,left,right,center,left),
    column-gutter: 8pt,
    row-gutter   : 0.8em,

    ..problems.children.map(grid.cell.with(x:1)),
    ..arr.keys().map(grid.cell.with(x:0)),
    ..(grid.cell("(", x:2 ),) * l,
    ..(grid.cell(")", x:4 ),) * l,
    ..ans
)

}
