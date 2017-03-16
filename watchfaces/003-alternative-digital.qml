/*
 * Copyright (C) 2015 Florent Revest <revestflo@gmail.com>
 *               2014 Aleksi Suomalainen <suomalainen.aleksi@gmail.com>
 * All rights reserved.
 *
 * You may use this file under the terms of BSD license as follows:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the author nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import QtQuick 2.1

Canvas {
    id: rootitem
    anchors.fill: parent
    contextType: "2d"
    renderStrategy: Canvas.Threaded;
    renderTarget: Canvas.Image
    antialiasing: true
    smooth: true

    function twoDigits(x) {
        if (x<10) return "0"+x;
        else      return x;
    }

    onPaint: {
        var ctx = getContext("2d")
        ctx.reset()
        ctx.fillStyle = "white"
        ctx.textAlign = "center"
        ctx.textBaseline = 'middle';
        ctx.shadowColor = "#80000000"
        ctx.shadowOffsetX = 3
        ctx.shadowOffsetY = 3
        ctx.shadowBlur = 3

        var medium = "57 "
        var light = "50 "

        var px = "px "

        var centerX = width/2
        var centerY = height/2

        // Hour & minute
        var text = Qt.formatDateTime(wallClock.time, "hh:mm")
        var fontSize = height*0.25
        var verticalOffset = height*0.03
        var fontFamily = "sans-serif"
        ctx.font = light + fontSize + px + fontFamily;
        ctx.fillText(text, centerX, centerY+verticalOffset);

        // Date
        text = Qt.formatDate(wallClock.time, "ddd d MMM")
        fontSize = height*0.05
        fontFamily = "sans-serif"
        verticalOffset = height*0.2
        ctx.font = medium + fontSize + px + fontFamily;
        ctx.fillText(text, centerX, centerY+verticalOffset);
    }
}

