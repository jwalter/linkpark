package com.example;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet
{

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
  {
    ServletOutputStream out = resp.getOutputStream();
    long timeStamp = System.currentTimeMillis() / 1000;
    URL parkUrl = new URL(
        "http://stkorspublicservices.linkoping.se/parkeringsapp/ParkeringsappV1.svc/GetParkeringsytaList/" + timeStamp);
    System.out.println("Reading from: " + parkUrl);
    BufferedReader in = new BufferedReader(new InputStreamReader(parkUrl.openStream(), "iso-8859-1"));

    String inputLine;
    while ((inputLine = in.readLine()) != null)
    {
      out.println(inputLine);
    }
    in.close();
    out.flush();
    out.close();
  }

}
