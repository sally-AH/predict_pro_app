import React, { useEffect, useState } from "react";
import axios from "axios";
import { sendRequest } from "../core/config/request";
import { requestMethods } from "../core/enums/requestMethods";

export const getUsers = () => {
  
    const [users, setUsers] = useState([]);
  
    useEffect(() => {
      const fetchData = async () => {
        try {
          const response = await sendRequest({
            route: "./getusers",
            method: requestMethods.GET,
          });
          console.log(response);
          setUsers(response);
        } catch (error) {
          console.log(error.response.status);
          if (error.response.status === 401) {
            console.log(error.response.status)
          }
        }
      };
  
      fetchData();
    }, []);

  };
  