import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import { Modal, Alert, Button } from "react-bootstrap";
const Login = () => {
  const handleLogin = () => {
    navigation("/pricing");
  };
  const navigation = useNavigate();

  return (
    <div
      style={{
        display: "flex",
        height: "90vh",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <div
        className="d-flex align-items-center"
        style={{
          width: "30%",
          border: "2px solid rgba(0,0,0,.3)",
          boxShadow: "2px 2px 10px 0px rgba(0,0,0,0.75)",
          height: "70%",
        }}
      >
        <form
          className="container "
          style={{ width: "90%" }}
          onSubmit={handleLogin}
        >
          <div
            className="d-flex justify-content-center h2 mb-3"
            style={{ color: "#3b55e6" }}
          >
            LOGIN{" "}
          </div>
          <div className="mb-3">
            <label
              for="exampleInputEmail1"
              className="form-label"
              style={{ fontWeight: 700, color: "#3b55e6" }}
            >
              Email address
            </label>
            <input
              type="email"
              className="form-control rounded-pill"
              style={{ borderColor: "#3b55e6" }}
              id="exampleInputEmail1"
              aria-describedby="emailHelp"
              placeholder="Enter your email"
            />
          </div>
          <div className="mb-3">
            <label
              for="exampleInputPassword1"
              className="form-label"
              style={{ fontWeight: 700, color: "#3b55e6" }}
            >
              Password
            </label>
            <input
              type="password"
              className="form-control rounded-pill"
              style={{ borderColor: "#3b55e6" }}
              id="exampleInputPassword1"
              placeholder="Enter your password"
            />
          </div>
          <div className="mb-3 d-flex justify-content-between">
            <div className="form-check">
              <input
                className="form-check-input"
                type="checkbox"
                value=""
                id="flexCheckDefault"
              />
              <label className="form-check-label" for="flexCheckDefault">
                Remember Me
              </label>
            </div>
            <a href="/" className="link-primary">
              Forgot Password?</a>
            {/* {/* <ForgotPassword /> */}
          </div>
          <div className="d-flex justify-content-center mt-3 ">
            {/* <Link to="/pricing"> */}
            <button
              className="btn btn-outline rounded-pill px-3"
              style={{
                // border: "1px solid #3b55e6",
                backgroundColor: "#3b55e6",
                color: "white",
              }}
              type="submit"
              onClick={handleLogin}
            >
              Login
            </button>
            {/* </Link> */}
          </div>
          <div className="text-center mt-2">
            <a href="/" className="link-primary">
              Don't have an account? Sign up
            </a>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
