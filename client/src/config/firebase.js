// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyA_yWJxHAy5elC5wMzyCPhq0gIbMbx2gkQ",
  authDomain: "mathnauts-f8121.firebaseapp.com",
  projectId: "mathnauts-f8121",
  storageBucket: "mathnauts-f8121.appspot.com",
  messagingSenderId: "819853892542",
  appId: "1:819853892542:web:8db60b16f9325a3837b7ef",
  measurementId: "G-MVQD3CKTVP"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);