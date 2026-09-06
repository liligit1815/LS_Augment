.class final Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;
.super Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;
.source "RemoteViews.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zte/toolsdk/widget/RemoteViews;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ResourceReflectionAction"
.end annotation


# static fields
.field static final COLOR_RESOURCE:I = 0x2

.field static final DIMEN_RESOURCE:I = 0x1

.field static final STRING_RESOURCE:I = 0x3


# instance fields
.field private final mResId:I

.field private final mResourceType:I


# direct methods
.method constructor <init>(ILjava/lang/String;III)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(ILjava/lang/String;I)V

    .line 2
    iput p4, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResourceType:I

    .line 3
    iput p5, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 4
    invoke-direct {p0, p1}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;-><init>(Landroid/os/Parcel;)V

    .line 5
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResourceType:I

    .line 6
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    return-void
.end method


# virtual methods
.method public getActionTag()I
    .locals 0

    .line 1
    const/16 p0, 0x18

    .line 2
    .line 3
    return p0
.end method

.method protected getParameterValue(Landroid/view/View;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    :try_start_0
    iget v2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResourceType:I

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    const/4 v4, 0x0

    .line 17
    const/4 v5, 0x4

    .line 18
    if-eq v2, v3, :cond_b

    .line 19
    .line 20
    const/4 v3, 0x2

    .line 21
    if-eq v2, v3, :cond_6

    .line 22
    .line 23
    const/4 p1, 0x3

    .line 24
    if-ne v2, p1, :cond_5

    .line 25
    .line 26
    iget p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 27
    .line 28
    const/16 v2, 0x9

    .line 29
    .line 30
    if-eq p1, v2, :cond_3

    .line 31
    .line 32
    const/16 v2, 0xa

    .line 33
    .line 34
    if-ne p1, v2, :cond_2

    .line 35
    .line 36
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 37
    .line 38
    if-nez p0, :cond_1

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_1
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getText(I)Ljava/lang/CharSequence;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 47
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    const-string v1, "string resources must be used as STRING or CHAR_SEQUENCE, not "

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    throw p1

    .line 71
    :cond_3
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 72
    .line 73
    if-nez p0, :cond_4

    .line 74
    .line 75
    return-object v0

    .line 76
    :cond_4
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_5
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 82
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v1, "unknown resource type: "

    .line 89
    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResourceType:I

    .line 94
    .line 95
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    throw p1

    .line 106
    :cond_6
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 107
    .line 108
    if-eq v1, v5, :cond_9

    .line 109
    .line 110
    const/16 v2, 0xf

    .line 111
    .line 112
    if-ne v1, v2, :cond_8

    .line 113
    .line 114
    iget v1, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 115
    .line 116
    if-nez v1, :cond_7

    .line 117
    .line 118
    return-object v0

    .line 119
    :cond_7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 124
    .line 125
    invoke-virtual {p1, p0}, Landroid/content/Context;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    return-object p0

    .line 130
    :cond_8
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 131
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 135
    .line 136
    .line 137
    const-string v1, "color resources must be used as INT or COLOR_STATE_LIST, not "

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 143
    .line 144
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    throw p1

    .line 155
    :cond_9
    iget v0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 156
    .line 157
    if-nez v0, :cond_a

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_a
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 165
    .line 166
    invoke-virtual {p1, p0}, Landroid/content/Context;->getColor(I)I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    :goto_0
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0

    .line 175
    :cond_b
    iget p1, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 176
    .line 177
    if-eq p1, v5, :cond_e

    .line 178
    .line 179
    const/4 v0, 0x6

    .line 180
    if-ne p1, v0, :cond_d

    .line 181
    .line 182
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 183
    .line 184
    if-nez p0, :cond_c

    .line 185
    .line 186
    const/4 p0, 0x0

    .line 187
    goto :goto_1

    .line 188
    :cond_c
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    :goto_1
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    return-object p0

    .line 197
    :cond_d
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 198
    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .line 203
    .line 204
    const-string v1, "dimen resources must be used as INT or FLOAT, not "

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->mType:I

    .line 210
    .line 211
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    throw p1

    .line 222
    :cond_e
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 223
    .line 224
    if-nez p0, :cond_f

    .line 225
    .line 226
    goto :goto_2

    .line 227
    :cond_f
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    :goto_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 232
    .line 233
    .line 234
    move-result-object p0
    :try_end_0
    .catch Lcom/zte/toolsdk/widget/RemoteViews$ActionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 235
    return-object p0

    .line 236
    :catchall_0
    move-exception p0

    .line 237
    new-instance p1, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;

    .line 238
    .line 239
    invoke-direct {p1, p0}, Lcom/zte/toolsdk/widget/RemoteViews$ActionException;-><init>(Ljava/lang/Throwable;)V

    .line 240
    .line 241
    .line 242
    throw p1

    .line 243
    :catch_0
    move-exception p0

    .line 244
    throw p0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/zte/toolsdk/widget/RemoteViews$BaseReflectionAction;->writeToParcel(Landroid/os/Parcel;I)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResourceType:I

    .line 5
    .line 6
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 7
    .line 8
    .line 9
    iget p0, p0, Lcom/zte/toolsdk/widget/RemoteViews$ResourceReflectionAction;->mResId:I

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeInt(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
