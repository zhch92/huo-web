$(document).ready(function() {
// 首页切换
        // $(".lside li").on("click", function() {
        //     $(this).addClass("active").siblings().removeClass("active");
        // })
        $(".table .chose .chose_item li").on("click", function() {
            $(this).addClass("chose_active").siblings().removeClass("chose_active")
        });
        $("#user").on("click", function() {
            $(".table_user").addClass("table_active");
            $(".table_complain").removeClass("table_active");

        });
        $("#complain").on("click", function() {
             $(".table_complain").addClass("table_active");
            $(".table_user").removeClass("table_active");
        })
// approve弹出层
$(".papers li .back").on("click",function(){
    $(".opacity-bg,.lightbox_2").show()
});
$(".lightbox_2 .bttn .back").on("click",function(){
    $(".opacity-bg,.lightbox_2").hide()
});
// user_details弹出层
$(".table_3 .bttn .past").on("click",function(){
    $(".opacity-bg,.lightbox_1").show()
});
$(".lightbox_1 .bttn .back").on("click",function(){
    $(".opacity-bg,.lightbox_1").hide()
});
$(".opinion_1").on("click",function(){
    $(".parent .child").show()
})
$(".child .bttn a").on("click",function(){
    $(".child").hide();
})

 })