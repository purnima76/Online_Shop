export const validate = (values) => {

  const errors = {};
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/i;
  if (!values.name) {
    errors.name = "Full name is required!";
  }
  if (!values.email) {
    errors.email = "Email is required!";
  } else if (!regex.test(values.email)) {
    errors.email = "This is not a valid email format!";
  }
  if (!values.password) {
    errors.password = "Password is required!";
  } else if (values.password.length < 8) {
    errors.password = "Password must be more than 8 characters";
  } else if (values.password.length > 16) {
    errors.password = "Password cannot exceed more than 16 characters";
  }
  if (!values.confirmPass) {
    errors.confirmPass = "Confirm Password is required!";
  } else if (values.password !== values.confirmPass) {
    errors.confirmPass = "Password and Confirm Password must be equal!";
  }
  return errors;
};
export const validateLogin = (values) => {

  const errors = {};
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/i;

  if (!values.email) {
    errors.email = "Email is required!";
  } else if (!regex.test(values.email)) {
    errors.email = "This is not a valid email format!";
  }
  if (!values.password) {
    errors.password = "Password is required!";
  } else if (values.password.length < 8) {
    errors.password = "Password must be more than 8 characters";
  } else if (values.password.length > 16) {
    errors.password = "Password cannot exceed more than 16 characters";
  }

  return errors;
};

