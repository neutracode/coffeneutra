<?php

use App\Http\Controllers\users\UsersController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('/otp/send/{number}', [UsersController::class, 'sendOtp']);
Route::post('/otp/check', [UsersController::class, 'checkOTP']);
