import express, { Request, Response } from "express";
import * as contactModel from "../models/contact";
import { Contact } from "../types/Contact";
const contactRouter = express.Router();
contactRouter.get("/", async (req: Request, res: Response) => {
  
  contactModel.findAll((err: Error, messages: Contact[]) => {
    if (err) {
      return res.status(500).json({ errorMessage: err.message });
    }

    res.status(200).json({ data: messages });
  });
});
contactRouter.get("/:id", async (req: Request, res: Response) => {
  
    contactModel.findOne((err: Error, messages: Contact[]) => {
      if (err) {
        return res.status(500).json({ errorMessage: err.message });
      }
  
      res.status(200).json({ data: messages });
    });
  });
  export const findOne = (contactId: number, callback: Function) => {
    const queryString = `SELECT * FROM users WHERE id=?`;
    db.query(queryString, contactId, (err, result) => {
      if (err) {
        callback(err);
      }
  
      const row = (<RowDataPacket>result)[0];
      const contact_message: Contact = {
        id: row.id,
        nume: row.nume,
        prenume: row.prenume,
        email: row.email,
        mesaj: row.mesaj,
      };
      callback(null, contact_message);
    });
  };

export {contactRouter}