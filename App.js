import { BrowserRouter, Routes, Route } from "react-router-dom";
import Header from "./components/Header";
import Registration from "./Pages/Resgistration";
import Login from "./Pages/Login";
import Pricing from "./components/Pricing";
import ModalPage from "./components/Modal";
import Dashboard from "./components/Dashboard";
import BaseEntityForm from "./components/BaseEntityForm";
import SpForm from "./components/SpForm";
import Level1Form from "./components/Level1Form";
import SpDashboard from "./components/SpDashboard";
import Faq from "./components/Faq";
import Blog from "./components/Blog";

function App() {
  return (
    <>
      <BrowserRouter>
        <Header />
        <Routes>
          <Route exact path="/" element={<Registration />} />
          <Route exact path="dashboard" element={<Dashboard />} />
          <Route exact path="login" element={<Login />} />
          <Route exact path="pricing" element={<Pricing />} />
          <Route exact path="modalpage" element={<ModalPage />}></Route>
          <Route exact path="sp_dashboard" element={<SpDashboard />}></Route>
          <Route exact path="faq" element={<Faq />}></Route>
          <Route exact path="blog" element={<Blog />}></Route>

          <Route
            exact
            path="base_entity_form"
            element={<BaseEntityForm />}
          ></Route>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
