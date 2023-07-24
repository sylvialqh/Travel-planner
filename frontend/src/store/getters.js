const getters = {
  // sidebar: state => state.app.sidebar,
  // device: state => state.app.device,
  token: state => state.user.token,
  // user: state => state.user
  avatar: state => state.user.avatar,
  name: state => state.user.name,
  id: state => state.user.id,
  home: state => state.plan.home
}
export default getters
