.class public final Lcom/android/quickstep/util/TaskGridNavHelper;
.super Ljava/lang/Object;
.source "TaskGridNavHelper.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/quickstep/util/TaskGridNavHelper$Companion;,
        Lcom/android/quickstep/util/TaskGridNavHelper$TaskNavDirection;,
        Lcom/android/quickstep/util/TaskGridNavHelper$WhenMappings;
    }
.end annotation


# static fields
.field public static final ADD_DESK_PLACEHOLDER_ID:I = -0x2

.field public static final CLEAR_ALL_PLACEHOLDER_ID:I = -0x1

.field public static final Companion:Lcom/android/quickstep/util/TaskGridNavHelper$Companion;


# instance fields
.field private final bottomRowIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final topIds:Lcom/android/launcher3/util/x0;

.field private final topRowIds:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/quickstep/util/TaskGridNavHelper$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/quickstep/util/TaskGridNavHelper$Companion;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/quickstep/util/TaskGridNavHelper;->Companion:Lcom/android/quickstep/util/TaskGridNavHelper$Companion;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/util/x0;Lcom/android/launcher3/util/x0;Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/x0;",
            "Lcom/android/launcher3/util/x0;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "topIds"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "bottomIds"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "largeTileIds"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topIds:Lcom/android/launcher3/util/x0;

    .line 20
    .line 21
    new-instance v0, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 27
    .line 28
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p4, :cond_0

    .line 36
    .line 37
    const/4 p0, -0x2

    .line 38
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 39
    .line 40
    .line 41
    move-result-object p4

    .line 42
    invoke-interface {v0, p4}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {v1, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-static {v0, p3}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 53
    .line 54
    .line 55
    invoke-static {v1, p3}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 56
    .line 57
    .line 58
    invoke-static {v0, p1}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 59
    .line 60
    .line 61
    invoke-static {v1, p2}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 62
    .line 63
    .line 64
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    sub-int/2addr p0, p1

    .line 73
    const/4 p1, 0x0

    .line 74
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-static {v1, p0}, Li4/m;->A0(Ljava/util/List;I)Ljava/util/List;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v0, p0}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 83
    .line 84
    .line 85
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    sub-int/2addr p0, p2

    .line 94
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    invoke-static {v0, p0}, Li4/m;->A0(Ljava/util/List;I)Ljava/util/List;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v1, p0}, Li4/m;->x(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 103
    .line 104
    .line 105
    const/4 p0, -0x1

    .line 106
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {v1, p0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public static final synthetic access$getColumn(Lcom/android/quickstep/util/TaskGridNavHelper;I)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/quickstep/util/TaskGridNavHelper;->getColumn(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final getColumn(I)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {p0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    return p0
.end method


# virtual methods
.method public final getNextGridPage(IILcom/android/quickstep/util/TaskGridNavHelper$TaskNavDirection;Z)I
    .locals 7

    .line 1
    const-string v0, "direction"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-interface {v1, v2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    :goto_0
    iget-object v2, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object v3, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    add-int v3, v1, p2

    .line 56
    .line 57
    sget-object v4, Lcom/android/quickstep/util/TaskGridNavHelper$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 58
    .line 59
    invoke-virtual {p3}, Ljava/lang/Enum;->ordinal()I

    .line 60
    .line 61
    .line 62
    move-result p3

    .line 63
    aget p3, v4, p3

    .line 64
    .line 65
    const/4 v4, 0x1

    .line 66
    if-eq p3, v4, :cond_10

    .line 67
    .line 68
    const/4 v5, 0x2

    .line 69
    if-eq p3, v5, :cond_10

    .line 70
    .line 71
    const/4 v5, 0x3

    .line 72
    if-eq p3, v5, :cond_d

    .line 73
    .line 74
    const/4 v5, 0x4

    .line 75
    const/4 v6, 0x0

    .line 76
    if-eq p3, v5, :cond_9

    .line 77
    .line 78
    const/4 v5, 0x5

    .line 79
    if-eq p3, v5, :cond_1

    .line 80
    .line 81
    return p1

    .line 82
    :cond_1
    if-eqz p4, :cond_3

    .line 83
    .line 84
    if-gez v3, :cond_2

    .line 85
    .line 86
    sub-int/2addr v2, v4

    .line 87
    goto :goto_1

    .line 88
    :cond_2
    rem-int v2, v3, v2

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :cond_3
    sub-int/2addr v2, v4

    .line 92
    invoke-static {v3, v2}, LA4/d;->e(II)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    :goto_1
    if-ltz p2, :cond_5

    .line 97
    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    iget-object p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Ljava/lang/Number;

    .line 107
    .line 108
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iget-object p2, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 113
    .line 114
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p2

    .line 118
    check-cast p2, Ljava/lang/Number;

    .line 119
    .line 120
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-eq p1, p2, :cond_4

    .line 125
    .line 126
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 127
    .line 128
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    check-cast p0, Ljava/lang/Number;

    .line 133
    .line 134
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    return p0

    .line 139
    :cond_4
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    check-cast p0, Ljava/lang/Number;

    .line 146
    .line 147
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    return p0

    .line 152
    :cond_5
    iget-object p2, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 153
    .line 154
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-interface {p2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    if-eqz p1, :cond_7

    .line 163
    .line 164
    if-gez v2, :cond_6

    .line 165
    .line 166
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 167
    .line 168
    invoke-interface {p0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    check-cast p0, Ljava/lang/Number;

    .line 173
    .line 174
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    return p0

    .line 179
    :cond_6
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 180
    .line 181
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    check-cast p0, Ljava/lang/Number;

    .line 186
    .line 187
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    return p0

    .line 192
    :cond_7
    iget-object p1, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 193
    .line 194
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    check-cast p1, Ljava/lang/Number;

    .line 199
    .line 200
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    .line 201
    .line 202
    .line 203
    move-result p1

    .line 204
    iget-object p2, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 205
    .line 206
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object p2

    .line 210
    check-cast p2, Ljava/lang/Number;

    .line 211
    .line 212
    invoke-virtual {p2}, Ljava/lang/Number;->intValue()I

    .line 213
    .line 214
    .line 215
    move-result p2

    .line 216
    if-eq p1, p2, :cond_8

    .line 217
    .line 218
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 219
    .line 220
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    check-cast p0, Ljava/lang/Number;

    .line 225
    .line 226
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 227
    .line 228
    .line 229
    move-result p0

    .line 230
    return p0

    .line 231
    :cond_8
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 232
    .line 233
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    check-cast p0, Ljava/lang/Number;

    .line 238
    .line 239
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    return p0

    .line 244
    :cond_9
    if-eqz p4, :cond_a

    .line 245
    .line 246
    if-gez v3, :cond_b

    .line 247
    .line 248
    add-int/lit8 v3, v2, -0x1

    .line 249
    .line 250
    goto :goto_2

    .line 251
    :cond_a
    invoke-static {v3, v6}, LA4/d;->c(II)I

    .line 252
    .line 253
    .line 254
    move-result v3

    .line 255
    :cond_b
    :goto_2
    iget-object p2, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topIds:Lcom/android/launcher3/util/x0;

    .line 256
    .line 257
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-eqz p1, :cond_c

    .line 262
    .line 263
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 264
    .line 265
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    check-cast p0, Ljava/lang/Number;

    .line 270
    .line 271
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 272
    .line 273
    .line 274
    move-result p0

    .line 275
    return p0

    .line 276
    :cond_c
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 277
    .line 278
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    check-cast p0, Ljava/lang/Number;

    .line 283
    .line 284
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    return p0

    .line 289
    :cond_d
    if-eqz p4, :cond_e

    .line 290
    .line 291
    rem-int/2addr v3, v2

    .line 292
    goto :goto_3

    .line 293
    :cond_e
    sub-int/2addr v2, v4

    .line 294
    invoke-static {v3, v2}, LA4/d;->e(II)I

    .line 295
    .line 296
    .line 297
    move-result v3

    .line 298
    :goto_3
    if-eqz v0, :cond_f

    .line 299
    .line 300
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 301
    .line 302
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    check-cast p0, Ljava/lang/Number;

    .line 307
    .line 308
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    return p0

    .line 313
    :cond_f
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 314
    .line 315
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    check-cast p0, Ljava/lang/Number;

    .line 320
    .line 321
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 322
    .line 323
    .line 324
    move-result p0

    .line 325
    return p0

    .line 326
    :cond_10
    if-eqz v0, :cond_11

    .line 327
    .line 328
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->bottomRowIds:Ljava/util/List;

    .line 329
    .line 330
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    check-cast p0, Ljava/lang/Number;

    .line 335
    .line 336
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    return p0

    .line 341
    :cond_11
    iget-object p0, p0, Lcom/android/quickstep/util/TaskGridNavHelper;->topRowIds:Ljava/util/List;

    .line 342
    .line 343
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    check-cast p0, Ljava/lang/Number;

    .line 348
    .line 349
    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    .line 350
    .line 351
    .line 352
    move-result p0

    .line 353
    return p0
.end method

.method public final gridTaskViewIdOffsetPairInTabOrderSequence(IZ)LC4/e;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)",
            "LC4/e<",
            "Lh4/l<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, p1, p2, v1}, Lcom/android/quickstep/util/TaskGridNavHelper$gridTaskViewIdOffsetPairInTabOrderSequence$1;-><init>(Lcom/android/quickstep/util/TaskGridNavHelper;IZLl4/d;)V

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, LC4/h;->b(Lu4/p;)LC4/e;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
