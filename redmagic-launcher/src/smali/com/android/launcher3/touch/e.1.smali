.class public Lcom/android/launcher3/touch/e;
.super Lcom/android/launcher3/touch/d;
.source "AllAppsSwipeController.java"


# static fields
.field public static final A:Landroid/view/animation/Interpolator;

.field public static final B:Landroid/view/animation/Interpolator;

.field public static final C:Landroid/view/animation/Interpolator;

.field public static final D:Landroid/view/animation/Interpolator;

.field private static final g:Landroid/view/animation/Interpolator;

.field private static final h:Landroid/view/animation/Interpolator;

.field private static final i:Landroid/view/animation/Interpolator;

.field private static final j:Landroid/view/animation/Interpolator;

.field private static final k:Landroid/view/animation/Interpolator;

.field private static final l:Landroid/view/animation/Interpolator;

.field public static final m:Landroid/view/animation/Interpolator;

.field public static final n:Landroid/view/animation/Interpolator;

.field public static final o:Landroid/view/animation/Interpolator;

.field public static final p:Landroid/view/animation/Interpolator;

.field public static final q:Landroid/view/animation/Interpolator;

.field public static final r:Landroid/view/animation/Interpolator;

.field public static final s:Landroid/view/animation/Interpolator;

.field public static final t:Landroid/view/animation/Interpolator;

.field public static final u:Landroid/view/animation/Interpolator;

.field public static final v:Landroid/view/animation/Interpolator;

.field public static final w:Landroid/view/animation/Interpolator;

.field public static final x:Landroid/view/animation/Interpolator;

.field public static final y:Landroid/view/animation/Interpolator;

.field public static final z:Landroid/view/animation/Interpolator;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .line 1
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 2
    .line 3
    const v1, 0x3dcccccd    # 0.1f

    .line 4
    .line 5
    .line 6
    const/high16 v2, 0x3f000000    # 0.5f

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    sput-object v1, Lcom/android/launcher3/touch/e;->g:Landroid/view/animation/Interpolator;

    .line 13
    .line 14
    const v1, 0x3e4ccccc    # 0.19999999f

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sput-object v1, Lcom/android/launcher3/touch/e;->h:Landroid/view/animation/Interpolator;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const v3, 0x3ecccccd    # 0.4f

    .line 25
    .line 26
    .line 27
    invoke-static {v0, v1, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    sput-object v4, Lcom/android/launcher3/touch/e;->i:Landroid/view/animation/Interpolator;

    .line 32
    .line 33
    sget-object v5, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 34
    .line 35
    const v6, 0x3eaaa64c    # 0.3333f

    .line 36
    .line 37
    .line 38
    invoke-static {v5, v1, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    sput-object v5, Lcom/android/launcher3/touch/e;->j:Landroid/view/animation/Interpolator;

    .line 43
    .line 44
    sget-object v7, Lcom/android/launcher3/anim/L;->l:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    sput-object v7, Lcom/android/launcher3/touch/e;->k:Landroid/view/animation/Interpolator;

    .line 47
    .line 48
    invoke-static {v0, v1, v2}, LJ0/h;->m(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    sput-object v2, Lcom/android/launcher3/touch/e;->l:Landroid/view/animation/Interpolator;

    .line 53
    .line 54
    const v8, 0x3e2ab368    # 0.1667f

    .line 55
    .line 56
    .line 57
    invoke-static {v2, v8, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    sput-object v9, Lcom/android/launcher3/touch/e;->m:Landroid/view/animation/Interpolator;

    .line 62
    .line 63
    invoke-static {v2, v1, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    sput-object v2, Lcom/android/launcher3/touch/e;->n:Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    sput-object v7, Lcom/android/launcher3/touch/e;->o:Landroid/view/animation/Interpolator;

    .line 70
    .line 71
    sput-object v7, Lcom/android/launcher3/touch/e;->p:Landroid/view/animation/Interpolator;

    .line 72
    .line 73
    sget-object v2, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 74
    .line 75
    invoke-static {v2, v8, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 76
    .line 77
    .line 78
    move-result-object v9

    .line 79
    sput-object v9, Lcom/android/launcher3/touch/e;->q:Landroid/view/animation/Interpolator;

    .line 80
    .line 81
    sput-object v4, Lcom/android/launcher3/touch/e;->r:Landroid/view/animation/Interpolator;

    .line 82
    .line 83
    sput-object v5, Lcom/android/launcher3/touch/e;->s:Landroid/view/animation/Interpolator;

    .line 84
    .line 85
    sput-object v7, Lcom/android/launcher3/touch/e;->t:Landroid/view/animation/Interpolator;

    .line 86
    .line 87
    invoke-static {v2, v8, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    sput-object v2, Lcom/android/launcher3/touch/e;->u:Landroid/view/animation/Interpolator;

    .line 92
    .line 93
    sput-object v4, Lcom/android/launcher3/touch/e;->v:Landroid/view/animation/Interpolator;

    .line 94
    .line 95
    sput-object v5, Lcom/android/launcher3/touch/e;->w:Landroid/view/animation/Interpolator;

    .line 96
    .line 97
    sput-object v7, Lcom/android/launcher3/touch/e;->x:Landroid/view/animation/Interpolator;

    .line 98
    .line 99
    const v2, 0x3f4ccccd    # 0.8f

    .line 100
    .line 101
    .line 102
    invoke-static {v0, v1, v2}, LJ0/h;->m(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    const v5, 0x3e874539    # 0.2642f

    .line 107
    .line 108
    .line 109
    invoke-static {v4, v5, v6}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    sput-object v4, Lcom/android/launcher3/touch/e;->y:Landroid/view/animation/Interpolator;

    .line 114
    .line 115
    const v4, 0x3def9db2    # 0.117f

    .line 116
    .line 117
    .line 118
    invoke-static {v0, v4, v3}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 119
    .line 120
    .line 121
    move-result-object v4

    .line 122
    sput-object v4, Lcom/android/launcher3/touch/e;->z:Landroid/view/animation/Interpolator;

    .line 123
    .line 124
    sget-object v4, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 125
    .line 126
    const v5, 0x3e4ccccd    # 0.2f

    .line 127
    .line 128
    .line 129
    const/high16 v7, 0x3f800000    # 1.0f

    .line 130
    .line 131
    invoke-static {v4, v5, v7}, LJ0/h;->m(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    const v5, 0x3f555326    # 0.8333f

    .line 136
    .line 137
    .line 138
    invoke-static {v4, v6, v5}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    sput-object v4, Lcom/android/launcher3/touch/e;->A:Landroid/view/animation/Interpolator;

    .line 143
    .line 144
    invoke-static {v0, v3, v2}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    sput-object v2, Lcom/android/launcher3/touch/e;->B:Landroid/view/animation/Interpolator;

    .line 149
    .line 150
    invoke-static {v0, v1, v7}, LJ0/h;->m(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {v2, v1, v7}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    sput-object v1, Lcom/android/launcher3/touch/e;->C:Landroid/view/animation/Interpolator;

    .line 159
    .line 160
    sput-object v0, Lcom/android/launcher3/touch/e;->D:Landroid/view/animation/Interpolator;

    .line 161
    .line 162
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/touch/H;->w:Lcom/android/launcher3/touch/H$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/touch/d;-><init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/touch/H$c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static c(Lcom/android/launcher3/C2;LQ1/f;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x4

    .line 10
    const/4 v2, 0x1

    .line 11
    const/16 v3, 0x10

    .line 12
    .line 13
    const/16 v4, 0xd

    .line 14
    .line 15
    const/4 v5, 0x0

    .line 16
    const/16 v6, 0xa

    .line 17
    .line 18
    const/16 v7, 0xb

    .line 19
    .line 20
    const/4 v8, 0x3

    .line 21
    if-eqz v0, :cond_4

    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/touch/e;->g:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    invoke-static {v0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p1, v7, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 30
    .line 31
    .line 32
    sget-object v0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 33
    .line 34
    invoke-virtual {p1, v6, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 44
    .line 45
    invoke-virtual {p1, v5, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    sget-object v0, LJ0/h;->y:Landroid/view/animation/Interpolator;

    .line 49
    .line 50
    invoke-virtual {p1, v2, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v4, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-nez p0, :cond_1

    .line 67
    .line 68
    sget-object p0, LJ0/h;->d:Landroid/view/animation/Interpolator;

    .line 69
    .line 70
    invoke-virtual {p1, v4, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 71
    .line 72
    .line 73
    :cond_1
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 74
    .line 75
    const v0, 0x3f666666    # 0.9f

    .line 76
    .line 77
    .line 78
    const/high16 v1, 0x3f800000    # 1.0f

    .line 79
    .line 80
    invoke-static {p0, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {p1, v8, v2}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p1, v3, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 100
    .line 101
    if-eqz p0, :cond_3

    .line 102
    .line 103
    sget-object p0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 104
    .line 105
    invoke-virtual {p1, v8, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {p1, v3, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 109
    .line 110
    .line 111
    iget p0, p1, LQ1/f;->i:I

    .line 112
    .line 113
    or-int/2addr p0, v1

    .line 114
    iput p0, p1, LQ1/f;->i:I

    .line 115
    .line 116
    :cond_3
    return-void

    .line 117
    :cond_4
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    if-eqz p0, :cond_5

    .line 122
    .line 123
    sget-object p0, Lcom/android/launcher3/touch/e;->n:Landroid/view/animation/Interpolator;

    .line 124
    .line 125
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, v4, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/android/launcher3/touch/e;->p:Landroid/view/animation/Interpolator;

    .line 133
    .line 134
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-virtual {p1, v8, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 139
    .line 140
    .line 141
    sget-object p0, Lcom/android/launcher3/touch/e;->r:Landroid/view/animation/Interpolator;

    .line 142
    .line 143
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p1, v2, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 148
    .line 149
    .line 150
    sget-object p0, Lcom/android/launcher3/touch/e;->t:Landroid/view/animation/Interpolator;

    .line 151
    .line 152
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, v3, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 157
    .line 158
    .line 159
    sget-object p0, Lcom/android/launcher3/touch/e;->v:Landroid/view/animation/Interpolator;

    .line 160
    .line 161
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p1, v1, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 166
    .line 167
    .line 168
    sget-object p0, Lcom/android/launcher3/touch/e;->x:Landroid/view/animation/Interpolator;

    .line 169
    .line 170
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    const/4 v0, 0x5

    .line 175
    invoke-virtual {p1, v0, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 176
    .line 177
    .line 178
    sget-object p0, Lcom/android/launcher3/touch/e;->z:Landroid/view/animation/Interpolator;

    .line 179
    .line 180
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 181
    .line 182
    .line 183
    move-result-object p0

    .line 184
    invoke-virtual {p1, v7, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/android/launcher3/touch/e;->B:Landroid/view/animation/Interpolator;

    .line 188
    .line 189
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {p1, v6, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/android/launcher3/touch/e;->D:Landroid/view/animation/Interpolator;

    .line 197
    .line 198
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {p1, v5, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 203
    .line 204
    .line 205
    return-void

    .line 206
    :cond_5
    sget-object p0, Lcom/android/launcher3/touch/e;->g:Landroid/view/animation/Interpolator;

    .line 207
    .line 208
    invoke-static {p0}, LJ0/h;->n(Landroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-virtual {p1, v7, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 213
    .line 214
    .line 215
    sget-object p0, Lcom/android/launcher3/touch/e;->h:Landroid/view/animation/Interpolator;

    .line 216
    .line 217
    invoke-virtual {p1, v6, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 218
    .line 219
    .line 220
    sget-object p0, Lcom/android/launcher3/anim/L;->f:Landroid/view/animation/Interpolator;

    .line 221
    .line 222
    invoke-virtual {p1, v8, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 223
    .line 224
    .line 225
    sget-object p0, LJ0/h;->c:Landroid/view/animation/Interpolator;

    .line 226
    .line 227
    invoke-virtual {p1, v5, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 228
    .line 229
    .line 230
    return-void
.end method

.method public static d(Lcom/android/launcher3/C2;LQ1/f;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->e1()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x4

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    const/16 v4, 0xb

    .line 13
    .line 14
    const/16 v5, 0xa

    .line 15
    .line 16
    const/16 v6, 0x10

    .line 17
    .line 18
    const/4 v7, 0x3

    .line 19
    const/16 v8, 0xd

    .line 20
    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    sget-object v0, LJ0/h;->f:Landroid/view/animation/Interpolator;

    .line 24
    .line 25
    invoke-virtual {p1, v5, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/android/launcher3/touch/e;->g:Landroid/view/animation/Interpolator;

    .line 29
    .line 30
    invoke-virtual {p1, v4, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_0

    .line 38
    .line 39
    sget-object v0, LJ0/h;->a:Landroid/view/animation/Interpolator;

    .line 40
    .line 41
    invoke-virtual {p1, v3, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    sget-object v0, LJ0/h;->y:Landroid/view/animation/Interpolator;

    .line 45
    .line 46
    invoke-virtual {p1, v2, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p1, v8, v0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 50
    .line 51
    .line 52
    invoke-static {}, Lcom/android/launcher3/y0;->b()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_1

    .line 57
    .line 58
    sget-object p0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 59
    .line 60
    invoke-virtual {p1, v8, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 61
    .line 62
    .line 63
    const/4 v0, 0x0

    .line 64
    const v1, 0x3dcccccd    # 0.1f

    .line 65
    .line 66
    .line 67
    invoke-static {p0, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {p1, v7, v2}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p0, v0, v1}, LJ0/h;->i(Landroid/view/animation/Interpolator;FF)Landroid/view/animation/Interpolator;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p1, v6, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->H0:Z

    .line 87
    .line 88
    if-eqz p0, :cond_2

    .line 89
    .line 90
    sget-object p0, LJ0/h;->g:Landroid/view/animation/Interpolator;

    .line 91
    .line 92
    invoke-virtual {p1, v7, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {p1, v6, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 96
    .line 97
    .line 98
    iget p0, p1, LQ1/f;->i:I

    .line 99
    .line 100
    or-int/2addr p0, v1

    .line 101
    iput p0, p1, LQ1/f;->i:I

    .line 102
    .line 103
    :cond_2
    return-void

    .line 104
    :cond_3
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-eqz p0, :cond_4

    .line 109
    .line 110
    sget-object p0, Lcom/android/launcher3/touch/e;->n:Landroid/view/animation/Interpolator;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_4
    sget-object p0, Lcom/android/launcher3/touch/e;->m:Landroid/view/animation/Interpolator;

    .line 114
    .line 115
    :goto_0
    invoke-virtual {p1, v8, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 119
    .line 120
    .line 121
    move-result p0

    .line 122
    if-eqz p0, :cond_5

    .line 123
    .line 124
    sget-object p0, Lcom/android/launcher3/touch/e;->p:Landroid/view/animation/Interpolator;

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_5
    sget-object p0, Lcom/android/launcher3/touch/e;->o:Landroid/view/animation/Interpolator;

    .line 128
    .line 129
    :goto_1
    invoke-virtual {p1, v7, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_6

    .line 137
    .line 138
    sget-object p0, Lcom/android/launcher3/touch/e;->r:Landroid/view/animation/Interpolator;

    .line 139
    .line 140
    goto :goto_2

    .line 141
    :cond_6
    sget-object p0, Lcom/android/launcher3/touch/e;->q:Landroid/view/animation/Interpolator;

    .line 142
    .line 143
    :goto_2
    invoke-virtual {p1, v2, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-eqz p0, :cond_7

    .line 151
    .line 152
    sget-object p0, Lcom/android/launcher3/touch/e;->t:Landroid/view/animation/Interpolator;

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_7
    sget-object p0, Lcom/android/launcher3/touch/e;->s:Landroid/view/animation/Interpolator;

    .line 156
    .line 157
    :goto_3
    invoke-virtual {p1, v6, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-eqz p0, :cond_8

    .line 165
    .line 166
    sget-object p0, Lcom/android/launcher3/touch/e;->v:Landroid/view/animation/Interpolator;

    .line 167
    .line 168
    goto :goto_4

    .line 169
    :cond_8
    sget-object p0, Lcom/android/launcher3/touch/e;->u:Landroid/view/animation/Interpolator;

    .line 170
    .line 171
    :goto_4
    invoke-virtual {p1, v1, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-eqz p0, :cond_9

    .line 179
    .line 180
    sget-object p0, Lcom/android/launcher3/touch/e;->x:Landroid/view/animation/Interpolator;

    .line 181
    .line 182
    goto :goto_5

    .line 183
    :cond_9
    sget-object p0, Lcom/android/launcher3/touch/e;->w:Landroid/view/animation/Interpolator;

    .line 184
    .line 185
    :goto_5
    const/4 v0, 0x5

    .line 186
    invoke-virtual {p1, v0, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-eqz p0, :cond_a

    .line 194
    .line 195
    sget-object p0, Lcom/android/launcher3/touch/e;->z:Landroid/view/animation/Interpolator;

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :cond_a
    sget-object p0, Lcom/android/launcher3/touch/e;->y:Landroid/view/animation/Interpolator;

    .line 199
    .line 200
    :goto_6
    invoke-virtual {p1, v4, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 201
    .line 202
    .line 203
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 204
    .line 205
    .line 206
    move-result p0

    .line 207
    if-eqz p0, :cond_b

    .line 208
    .line 209
    sget-object p0, Lcom/android/launcher3/touch/e;->B:Landroid/view/animation/Interpolator;

    .line 210
    .line 211
    goto :goto_7

    .line 212
    :cond_b
    sget-object p0, Lcom/android/launcher3/touch/e;->A:Landroid/view/animation/Interpolator;

    .line 213
    .line 214
    :goto_7
    invoke-virtual {p1, v5, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p1}, LQ1/f;->d()Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-eqz p0, :cond_c

    .line 222
    .line 223
    sget-object p0, Lcom/android/launcher3/touch/e;->D:Landroid/view/animation/Interpolator;

    .line 224
    .line 225
    goto :goto_8

    .line 226
    :cond_c
    sget-object p0, Lcom/android/launcher3/touch/e;->C:Landroid/view/animation/Interpolator;

    .line 227
    .line 228
    :goto_8
    invoke-virtual {p1, v3, p0}, LQ1/f;->e(ILandroid/view/animation/Interpolator;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method


# virtual methods
.method protected canInterceptTouch(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    return v2

    .line 17
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    sget-object v3, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 20
    .line 21
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    sget-object v3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 30
    .line 31
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    return v2

    .line 38
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    sget-object v3, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 41
    .line 42
    invoke-interface {v0, v3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/r;->z0(Landroid/view/MotionEvent;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-nez p0, :cond_3

    .line 59
    .line 60
    return v2

    .line 61
    :cond_3
    return v1
.end method

.method protected getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/touch/d;->getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, v0, LQ1/f;->h:I

    .line 6
    .line 7
    or-int/lit8 v1, v1, 0x1

    .line 8
    .line 9
    iput v1, v0, LQ1/f;->h:I

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    if-ne p1, v1, :cond_0

    .line 14
    .line 15
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 16
    .line 17
    if-ne p2, v2, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/android/launcher3/touch/e;->d(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 22
    .line 23
    .line 24
    return-object v0

    .line 25
    :cond_0
    sget-object v2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    if-ne p1, v2, :cond_1

    .line 28
    .line 29
    if-ne p2, v1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-static {p0, v0}, Lcom/android/launcher3/touch/e;->c(Lcom/android/launcher3/C2;LQ1/f;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-object v0
.end method

.method protected getTargetState(Lcom/android/launcher3/V3;Z)Lcom/android/launcher3/V3;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    if-ne p1, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p2}, Lcom/android/launcher3/touch/d;->shouldOpenAllApps(Z)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 32
    .line 33
    if-ne p1, p0, :cond_2

    .line 34
    .line 35
    if-nez p2, :cond_2

    .line 36
    .line 37
    return-object v0

    .line 38
    :cond_2
    :goto_0
    return-object p1
.end method

.method protected initCurrentAnimation()F
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/touch/d;->getShiftRange()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    invoke-virtual {p0, v1, v2}, Lcom/android/launcher3/touch/e;->getConfigForStates(Lcom/android/launcher3/V3;Lcom/android/launcher3/V3;)LQ1/f;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/high16 v2, 0x40000000    # 2.0f

    .line 14
    .line 15
    mul-float/2addr v2, v0

    .line 16
    float-to-long v2, v2

    .line 17
    iput-wide v2, v1, LQ1/f;->g:J

    .line 18
    .line 19
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 26
    .line 27
    invoke-virtual {v2, v3, v1}, Lcom/android/launcher3/statemanager/d;->p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, p0, Lcom/android/launcher3/touch/d;->mCurrentAnimation:Lcom/android/launcher3/anim/q;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/touch/d;->mFromState:Lcom/android/launcher3/V3;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    mul-float/2addr v1, v0

    .line 42
    iget-object v2, p0, Lcom/android/launcher3/touch/d;->mToState:Lcom/android/launcher3/V3;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/touch/d;->mLauncher:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {v2, p0}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    mul-float/2addr p0, v0

    .line 51
    sub-float/2addr p0, v1

    .line 52
    const/high16 v0, 0x3f800000    # 1.0f

    .line 53
    .line 54
    div-float/2addr v0, p0

    .line 55
    return v0
.end method
