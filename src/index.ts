import express from 'express';
import './database';
import indexRoutes from './routes/index.routes';

const app: express.Application = express();

app.use(indexRoutes);

export { app };