<template>
<div>
  <div>
    <el-menu
        :default-active="activeIndex"
        class="el-menu-demo"
        mode="horizontal"
        background-color="#545c64"
        text-color="#fff"
        active-text-color="#ffd04b">
      <el-menu-item index="1">{{ day }} days Trip to {{des}} </el-menu-item>
    </el-menu>

    <b-tabs content-class="mt-3" align="center">
      <b-tab title="Overview" active title-item-class="col-6" ><PlanBodyView></PlanBodyView></b-tab>
<!--      <b-tab title="Edit this Plan"  title-item-class="col-3"><p>I'm the second tab</p></b-tab>-->
    </b-tabs>
  </div>
</div>
</template>

<script>
import PlanBodyView from "@/views/PlanBodyView";
export default {
  name: "PlanView",
  components: {PlanBodyView},
  data() {
    return {
      activeIndex: '1',
      home:this.$store.state.plan.home,
      des:this.$store.state.plan.des,
      startDay:this.$store.state.plan.startDay,
      endDay:this.$store.state.plan.endDay,
      budget:this.$store.state.plan.budget,
      style:this.$store.state.plan.style,
      day:''

    };
  },
  methods:{

  }, created: function () {
    let start=new Date(this.startDay)
    let end=new Date(this.endDay)
    this.day=(end-start)/(24*60*60*1000)+1
  }

}
</script>

<style scoped>

</style>
