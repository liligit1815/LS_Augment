.class public Lcom/android/launcher3/r4;
.super Ljava/lang/Object;
.source "MFVInvariantDeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/r4$a;
    }
.end annotation


# static fields
.field public static A0:Ljava/lang/String;

.field private static B0:I


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Ljava/lang/String;

.field public E:I

.field public F:Z

.field public G:Z

.field public H:Z

.field public I:Z

.field public J:Z

.field public K:Z

.field public L:Ljava/lang/String;

.field public M:Z

.field public N:I

.field O:F

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:Z

.field public U:I

.field public V:F

.field public W:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final X:Ljava/util/regex/Pattern;

.field public Y:Z

.field public Z:Z

.field public a:I

.field public a0:Z

.field public b:Ljava/lang/String;

.field private b0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field

.field public c:Z

.field private c0:Z

.field public d:Z

.field public d0:Z

.field public e:Z

.field public e0:Z

.field public f:Z

.field public f0:Z

.field public g:Z

.field public g0:Z

.field public h:Z

.field public h0:Z

.field public i:Z

.field public i0:Z

.field public j:Z

.field public j0:Z

.field public k:Z

.field public k0:Z

.field public l:Z

.field public l0:Z

.field public m:Ljava/lang/String;

.field public m0:Z

.field private n:F

.field public n0:Z

.field public o:F

.field public o0:I

.field public p:Z

.field public p0:I

.field public q:I

.field public q0:Z

.field public r:I

.field private r0:I

.field public s:Z

.field public s0:Z

.field public t:Z

.field private t0:Ljava/lang/String;

.field public u:Z

.field private u0:Ljava/lang/String;

.field private v:Z

.field private v0:Ljava/lang/String;

.field public w:Z

.field private w0:Z

.field public x:I

.field private x0:Z

.field public y:I

.field private y0:Z

.field public z:Z

.field public z0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Lx1/S;->r()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "cn.nubia.mifavor.miboard"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, "com.zte.mifavor.miboard"

    .line 11
    .line 12
    :goto_0
    sput-object v0, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lm1/a;->a()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x4

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    const/4 v0, 0x3

    .line 23
    :goto_1
    sput v0, Lcom/android/launcher3/r4;->B0:I

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/android/launcher3/r4;->a:I

    .line 6
    .line 7
    const-string v1, "default_effect_smooth"

    .line 8
    .line 9
    iput-object v1, p0, Lcom/android/launcher3/r4;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->c:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->d:Z

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->e:Z

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->f:Z

    .line 19
    .line 20
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->g:Z

    .line 21
    .line 22
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->h:Z

    .line 23
    .line 24
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->i:Z

    .line 25
    .line 26
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->j:Z

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->k:Z

    .line 29
    .line 30
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->l:Z

    .line 31
    .line 32
    const-string v2, "pointer_clock_default"

    .line 33
    .line 34
    iput-object v2, p0, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 35
    .line 36
    const/high16 v2, 0x3f800000    # 1.0f

    .line 37
    .line 38
    iput v2, p0, Lcom/android/launcher3/r4;->n:F

    .line 39
    .line 40
    iput v2, p0, Lcom/android/launcher3/r4;->o:F

    .line 41
    .line 42
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->p:Z

    .line 43
    .line 44
    iput v1, p0, Lcom/android/launcher3/r4;->q:I

    .line 45
    .line 46
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->s:Z

    .line 47
    .line 48
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->t:Z

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->u:Z

    .line 51
    .line 52
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->v:Z

    .line 53
    .line 54
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->w:Z

    .line 55
    .line 56
    iput v0, p0, Lcom/android/launcher3/r4;->x:I

    .line 57
    .line 58
    iput v0, p0, Lcom/android/launcher3/r4;->y:I

    .line 59
    .line 60
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->z:Z

    .line 61
    .line 62
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->A:Z

    .line 63
    .line 64
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->B:Z

    .line 65
    .line 66
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->C:Z

    .line 67
    .line 68
    const-string v3, ""

    .line 69
    .line 70
    iput-object v3, p0, Lcom/android/launcher3/r4;->D:Ljava/lang/String;

    .line 71
    .line 72
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->F:Z

    .line 73
    .line 74
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->G:Z

    .line 75
    .line 76
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->H:Z

    .line 77
    .line 78
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->I:Z

    .line 79
    .line 80
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->J:Z

    .line 81
    .line 82
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->K:Z

    .line 83
    .line 84
    iput-object v3, p0, Lcom/android/launcher3/r4;->L:Ljava/lang/String;

    .line 85
    .line 86
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->M:Z

    .line 87
    .line 88
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->T:Z

    .line 89
    .line 90
    iput v2, p0, Lcom/android/launcher3/r4;->V:F

    .line 91
    .line 92
    new-instance v2, Ljava/util/HashSet;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v2, p0, Lcom/android/launcher3/r4;->W:Ljava/util/Set;

    .line 98
    .line 99
    const-string v2, ","

    .line 100
    .line 101
    invoke-static {v2}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    iput-object v2, p0, Lcom/android/launcher3/r4;->X:Ljava/util/regex/Pattern;

    .line 106
    .line 107
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->Y:Z

    .line 108
    .line 109
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->Z:Z

    .line 110
    .line 111
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->a0:Z

    .line 112
    .line 113
    new-instance v2, Ljava/util/ArrayList;

    .line 114
    .line 115
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 116
    .line 117
    .line 118
    iput-object v2, p0, Lcom/android/launcher3/r4;->b0:Ljava/util/ArrayList;

    .line 119
    .line 120
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->c0:Z

    .line 121
    .line 122
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->d0:Z

    .line 123
    .line 124
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->e0:Z

    .line 125
    .line 126
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->f0:Z

    .line 127
    .line 128
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 129
    .line 130
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->h0:Z

    .line 131
    .line 132
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->i0:Z

    .line 133
    .line 134
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->j0:Z

    .line 135
    .line 136
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->k0:Z

    .line 137
    .line 138
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->l0:Z

    .line 139
    .line 140
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->m0:Z

    .line 141
    .line 142
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->n0:Z

    .line 143
    .line 144
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->q0:Z

    .line 145
    .line 146
    const/4 v2, -0x1

    .line 147
    iput v2, p0, Lcom/android/launcher3/r4;->r0:I

    .line 148
    .line 149
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->s0:Z

    .line 150
    .line 151
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->w0:Z

    .line 152
    .line 153
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->x0:Z

    .line 154
    .line 155
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->y0:Z

    .line 156
    .line 157
    new-instance v0, Ljava/util/ArrayList;

    .line 158
    .line 159
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 160
    .line 161
    .line 162
    iput-object v0, p0, Lcom/android/launcher3/r4;->z0:Ljava/util/ArrayList;

    .line 163
    .line 164
    return-void
.end method

.method private a(Lcom/android/launcher3/F1;Landroid/content/Context;Landroid/util/DisplayMetrics;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    const/4 v0, 0x3

    .line 10
    const/4 v1, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    sget p3, Lcom/android/launcher3/r4;->B0:I

    .line 15
    .line 16
    iput p3, p1, Lcom/android/launcher3/F1;->d1:I

    .line 17
    .line 18
    iput p3, p1, Lcom/android/launcher3/F1;->e1:I

    .line 19
    .line 20
    iget-object p3, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 21
    .line 22
    aput v0, p3, v1

    .line 23
    .line 24
    iget-object p3, p1, Lcom/android/launcher3/F1;->K0:[I

    .line 25
    .line 26
    aput v0, p3, v1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_0
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->p()Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-eqz p3, :cond_1

    .line 38
    .line 39
    iput v2, p1, Lcom/android/launcher3/F1;->d1:I

    .line 40
    .line 41
    iput v2, p1, Lcom/android/launcher3/F1;->e1:I

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const-string p3, "config_num_hotseat_icons"

    .line 45
    .line 46
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    iput p3, p1, Lcom/android/launcher3/F1;->d1:I

    .line 51
    .line 52
    iput p3, p1, Lcom/android/launcher3/F1;->e1:I

    .line 53
    .line 54
    :goto_0
    iget-object p3, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 55
    .line 56
    const-string v3, "config_num_folder_rows"

    .line 57
    .line 58
    invoke-static {p2, v3, v0}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    aput v3, p3, v2

    .line 63
    .line 64
    aput v3, p3, v1

    .line 65
    .line 66
    iget-object p3, p1, Lcom/android/launcher3/F1;->K0:[I

    .line 67
    .line 68
    const-string v3, "config_num_folder_columns"

    .line 69
    .line 70
    invoke-static {p2, v3, v0}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    aput v0, p3, v2

    .line 75
    .line 76
    aput v0, p3, v1

    .line 77
    .line 78
    :goto_1
    invoke-static {}, Lx1/O;->C3()Z

    .line 79
    .line 80
    .line 81
    move-result p3

    .line 82
    if-eqz p3, :cond_2

    .line 83
    .line 84
    const/16 p3, 0x8

    .line 85
    .line 86
    iput p3, p1, Lcom/android/launcher3/F1;->d1:I

    .line 87
    .line 88
    iput p3, p1, Lcom/android/launcher3/F1;->e1:I

    .line 89
    .line 90
    :cond_2
    iget p3, p1, Lcom/android/launcher3/F1;->d1:I

    .line 91
    .line 92
    const/4 v0, 0x2

    .line 93
    div-int/2addr p3, v0

    .line 94
    iput p3, p0, Lcom/android/launcher3/r4;->P:I

    .line 95
    .line 96
    iget-object p3, p1, Lcom/android/launcher3/F1;->J0:[I

    .line 97
    .line 98
    aget p3, p3, v1

    .line 99
    .line 100
    iget-object v3, p1, Lcom/android/launcher3/F1;->K0:[I

    .line 101
    .line 102
    aget v3, v3, v1

    .line 103
    .line 104
    mul-int/2addr p3, v3

    .line 105
    iput p3, p1, Lcom/android/launcher3/r4;->U:I

    .line 106
    .line 107
    const-string p3, "config_show_home_layout_switch"

    .line 108
    .line 109
    invoke-static {p2, p3, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    if-ne p3, v2, :cond_3

    .line 114
    .line 115
    move p3, v2

    .line 116
    goto :goto_2

    .line 117
    :cond_3
    move p3, v1

    .line 118
    :goto_2
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->f:Z

    .line 119
    .line 120
    const-string p3, "config_show_home_layout_stand_another"

    .line 121
    .line 122
    invoke-static {p2, p3, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 123
    .line 124
    .line 125
    move-result p3

    .line 126
    if-ne p3, v2, :cond_4

    .line 127
    .line 128
    move p3, v2

    .line 129
    goto :goto_3

    .line 130
    :cond_4
    move p3, v1

    .line 131
    :goto_3
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->g:Z

    .line 132
    .line 133
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 134
    .line 135
    .line 136
    move-result-object p3

    .line 137
    invoke-virtual {p3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 138
    .line 139
    .line 140
    move-result p3

    .line 141
    if-eqz p3, :cond_5

    .line 142
    .line 143
    :goto_4
    move p3, v2

    .line 144
    goto :goto_5

    .line 145
    :cond_5
    const-string p3, "config_two_line_title"

    .line 146
    .line 147
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    move-result p3

    .line 151
    if-ne p3, v2, :cond_6

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_6
    move p3, v1

    .line 155
    :goto_5
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->c:Z

    .line 156
    .line 157
    invoke-static {}, Lm1/a;->b()Z

    .line 158
    .line 159
    .line 160
    move-result p3

    .line 161
    if-eqz p3, :cond_7

    .line 162
    .line 163
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->c:Z

    .line 164
    .line 165
    :cond_7
    const-string p3, "config_cloud_folder"

    .line 166
    .line 167
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    if-ne p3, v2, :cond_8

    .line 172
    .line 173
    move p3, v2

    .line 174
    goto :goto_6

    .line 175
    :cond_8
    move p3, v1

    .line 176
    :goto_6
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->d:Z

    .line 177
    .line 178
    const-string p3, "config_show_hotseat_text"

    .line 179
    .line 180
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result p3

    .line 184
    if-ne p3, v2, :cond_9

    .line 185
    .line 186
    move p3, v2

    .line 187
    goto :goto_7

    .line 188
    :cond_9
    move p3, v1

    .line 189
    :goto_7
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->e:Z

    .line 190
    .line 191
    const-string p3, "config_show_disable_menu"

    .line 192
    .line 193
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result p3

    .line 197
    if-ne p3, v2, :cond_a

    .line 198
    .line 199
    move p3, v2

    .line 200
    goto :goto_8

    .line 201
    :cond_a
    move p3, v1

    .line 202
    :goto_8
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->A:Z

    .line 203
    .line 204
    const-string p3, "config_addIconAfterInsertingSimCard"

    .line 205
    .line 206
    invoke-static {p2, p3, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 207
    .line 208
    .line 209
    move-result p3

    .line 210
    if-ne p3, v2, :cond_b

    .line 211
    .line 212
    move p3, v2

    .line 213
    goto :goto_9

    .line 214
    :cond_b
    move p3, v1

    .line 215
    :goto_9
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->B:Z

    .line 216
    .line 217
    const-string p3, "config_change_APP_name_text_size_follow_font_size"

    .line 218
    .line 219
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    move-result p3

    .line 223
    iput p3, p0, Lcom/android/launcher3/r4;->E:I

    .line 224
    .line 225
    const-string p3, "config_landscape_workspace_show_title"

    .line 226
    .line 227
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result p3

    .line 231
    if-ne p3, v2, :cond_c

    .line 232
    .line 233
    move p3, v2

    .line 234
    goto :goto_a

    .line 235
    :cond_c
    move p3, v1

    .line 236
    :goto_a
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->T:Z

    .line 237
    .line 238
    const-string p3, "config_ease_big_font"

    .line 239
    .line 240
    invoke-static {p2, p3, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 241
    .line 242
    .line 243
    move-result p3

    .line 244
    if-ne p3, v2, :cond_d

    .line 245
    .line 246
    move p3, v2

    .line 247
    goto :goto_b

    .line 248
    :cond_d
    move p3, v1

    .line 249
    :goto_b
    iput-boolean p3, p0, Lcom/android/launcher3/r4;->M:Z

    .line 250
    .line 251
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 252
    .line 253
    .line 254
    move-result p3

    .line 255
    xor-int/2addr p3, v2

    .line 256
    const-string v3, "config_show_recent_style_switch"

    .line 257
    .line 258
    invoke-static {p2, v3, p3}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 259
    .line 260
    .line 261
    move-result p3

    .line 262
    if-ne p3, v2, :cond_e

    .line 263
    .line 264
    move v1, v2

    .line 265
    :cond_e
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->n0:Z

    .line 266
    .line 267
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 268
    .line 269
    .line 270
    move-result p3

    .line 271
    if-eqz p3, :cond_f

    .line 272
    .line 273
    move v2, v0

    .line 274
    :cond_f
    const-string p3, "config_recent_style_default_value"

    .line 275
    .line 276
    invoke-static {p2, p3, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 277
    .line 278
    .line 279
    move-result p3

    .line 280
    iput p3, p0, Lcom/android/launcher3/r4;->o0:I

    .line 281
    .line 282
    const-string p3, "config_miboard_package"

    .line 283
    .line 284
    invoke-static {p2, p3}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p3

    .line 288
    const v0, 0x7f140272

    .line 289
    .line 290
    .line 291
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    if-nez v1, :cond_10

    .line 300
    .line 301
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 302
    .line 303
    .line 304
    move-result v1

    .line 305
    if-nez v1, :cond_10

    .line 306
    .line 307
    invoke-virtual {v0, p3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-eqz v0, :cond_10

    .line 312
    .line 313
    sput-object p3, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 314
    .line 315
    sput-object p3, Ly1/b;->u:Ljava/lang/String;

    .line 316
    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 320
    .line 321
    .line 322
    const-string v1, "miboardPackage="

    .line 323
    .line 324
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p3

    .line 334
    const-string v0, "MFVInvariantDProfile"

    .line 335
    .line 336
    invoke-static {v0, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 337
    .line 338
    .line 339
    :cond_10
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/r4;->A(Lcom/android/launcher3/F1;Landroid/content/Context;)V

    .line 340
    .line 341
    .line 342
    invoke-static {p2}, Lcom/android/launcher3/r4;->m(Landroid/content/Context;)I

    .line 343
    .line 344
    .line 345
    move-result p1

    .line 346
    iput p1, p0, Lcom/android/launcher3/r4;->a:I

    .line 347
    .line 348
    invoke-static {p2}, Lcom/android/launcher3/r4;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/android/launcher3/r4;->b:Ljava/lang/String;

    .line 353
    .line 354
    invoke-direct {p0, p2}, Lcom/android/launcher3/r4;->n(Landroid/content/Context;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {p0, p2}, Lcom/android/launcher3/r4;->P(Landroid/content/Context;)I

    .line 358
    .line 359
    .line 360
    return-void
.end method

.method private i(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "config_fake_apps"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string v0, ";"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    array-length v0, p1

    .line 25
    const/4 v1, 0x0

    .line 26
    :goto_0
    if-ge v1, v0, :cond_1

    .line 27
    .line 28
    aget-object v2, p1, v1

    .line 29
    .line 30
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    .line 39
    goto :goto_1

    .line 40
    :catch_0
    move-exception p1

    .line 41
    goto :goto_2

    .line 42
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    const-string v1, "getConfigFakeComponentNameList: error e = "

    .line 51
    .line 52
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    const-string v0, "MFVInvariantDProfile"

    .line 67
    .line 68
    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    :cond_1
    return-object p0
.end method

.method protected static l(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "default_effect_id"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string p0, "default_effect_smooth"

    .line 14
    .line 15
    :cond_0
    return-object p0
.end method

.method protected static m(Landroid/content/Context;)I
    .locals 1

    .line 1
    const-string v0, "config_workspaceDefaultScreen"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lcom/android/launcher3/v4;->a(Landroid/content/Context;Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-lt p0, v0, :cond_0

    .line 9
    .line 10
    sub-int/2addr p0, v0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method private n(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-string v0, "config_fixed_order_app_component"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/r4;->X:Ljava/util/regex/Pattern;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_2

    .line 20
    .line 21
    array-length v0, p1

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_0
    array-length v0, p1

    .line 26
    const/4 v1, 0x0

    .line 27
    :goto_0
    if-ge v1, v0, :cond_2

    .line 28
    .line 29
    aget-object v2, p1, v1

    .line 30
    .line 31
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    if-nez v3, :cond_1

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/r4;->W:Ljava/util/Set;

    .line 38
    .line 39
    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v4, "getFixedOrderAPPInfo, componentName : "

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    const-string v3, "MFVInvariantDProfile"

    .line 60
    .line 61
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_2
    :goto_1
    return-void
.end method

.method private r()F
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->o()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const v0, 0x3f8ccccd    # 1.1f

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const v0, 0x3f87ae14    # 1.06f

    .line 16
    .line 17
    .line 18
    :goto_0
    const/4 v1, 0x0

    .line 19
    cmpg-float v1, v1, p0

    .line 20
    .line 21
    const/high16 v2, 0x3f800000    # 1.0f

    .line 22
    .line 23
    if-gtz v1, :cond_1

    .line 24
    .line 25
    cmpg-float v1, p0, v2

    .line 26
    .line 27
    if-gez v1, :cond_1

    .line 28
    .line 29
    const v0, 0x3dccccd0    # 0.100000024f

    .line 30
    .line 31
    .line 32
    mul-float/2addr v0, p0

    .line 33
    const p0, 0x3f666666    # 0.9f

    .line 34
    .line 35
    .line 36
    add-float v2, v0, p0

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    cmpg-float v1, v2, p0

    .line 40
    .line 41
    if-gtz v1, :cond_2

    .line 42
    .line 43
    const/high16 v1, 0x40000000    # 2.0f

    .line 44
    .line 45
    cmpg-float v1, p0, v1

    .line 46
    .line 47
    if-gtz v1, :cond_2

    .line 48
    .line 49
    sub-float/2addr v0, v2

    .line 50
    sub-float/2addr p0, v2

    .line 51
    mul-float/2addr v0, p0

    .line 52
    add-float/2addr v2, v0

    .line 53
    :cond_2
    :goto_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v0, "getFolderIconSizeScale: "

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    const-string v0, "MFVInvariantDProfile"

    .line 71
    .line 72
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    .line 74
    .line 75
    return v2
.end method

.method private s(Landroid/content/Context;)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v0, "config_custom_icon_pkg_cls_list"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    const-string v0, ";"

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_1

    .line 25
    .line 26
    array-length v0, p1

    .line 27
    const/4 v1, 0x0

    .line 28
    :goto_0
    if-ge v1, v0, :cond_1

    .line 29
    .line 30
    aget-object v2, p1, v1

    .line 31
    .line 32
    invoke-static {v2}, Landroid/content/ComponentName;->unflattenFromString(Ljava/lang/String;)Landroid/content/ComponentName;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    .line 41
    goto :goto_1

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_2

    .line 44
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :goto_2
    const-string v0, "MFVInvariantDProfile"

    .line 48
    .line 49
    const-string v1, "initConfigCustomIconComponentNameList error"

    .line 50
    .line 51
    invoke-static {v0, v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 52
    .line 53
    .line 54
    :cond_1
    return-object p0
.end method

.method private u()V
    .locals 5

    .line 1
    const-string v0, "android"

    .line 2
    .line 3
    const-string v1, "dimen"

    .line 4
    .line 5
    const-string v2, "MFVInvariantDProfile"

    .line 6
    .line 7
    :try_start_0
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    const-string v4, "status_bar_height_default"

    .line 12
    .line 13
    invoke-virtual {v3, v4, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    invoke-virtual {v4, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 22
    .line 23
    .line 24
    move-result v3

    .line 25
    float-to-int v3, v3

    .line 26
    iput v3, p0, Lcom/android/launcher3/r4;->Q:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catch_0
    const-string v3, "initStatusAndNavHeightPx stausbarHeightPx error!"

    .line 30
    .line 31
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    :goto_0
    :try_start_1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    const-string v4, "navigation_bar_height"

    .line 39
    .line 40
    invoke-virtual {v3, v4, v1, v0}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    float-to-int v0, v0

    .line 53
    iput v0, p0, Lcom/android/launcher3/r4;->R:I
    :try_end_1
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :catch_1
    const-string v0, "initStatusAndNavHeightPx navbarHeightPx "

    .line 57
    .line 58
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v1, "initStatusAndNavHeightPx: "

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v1, p0, Lcom/android/launcher3/r4;->Q:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v1, " , "

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    iget p0, p0, Lcom/android/launcher3/r4;->R:I

    .line 82
    .line 83
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method private v()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/r4;->z0:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method


# virtual methods
.method protected A(Lcom/android/launcher3/F1;Landroid/content/Context;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "integer"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->M:Z

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "config_icon_text_size_ease_big_font"

    .line 22
    .line 23
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string v0, "config_icon_text_size_ease"

    .line 37
    .line 38
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    goto :goto_0

    .line 47
    :cond_1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->c:Z

    .line 48
    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-nez p0, :cond_2

    .line 56
    .line 57
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v0, "config_icon_text_size_two_line"

    .line 62
    .line 63
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string v0, "config_icon_text_size_single_line"

    .line 77
    .line 78
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    :goto_0
    if-gtz p0, :cond_3

    .line 87
    .line 88
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v0, "config_icon_text_size"

    .line 93
    .line 94
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {p0, v0, v1, v2}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    :cond_3
    iget-object v0, p1, Lcom/android/launcher3/F1;->M0:[F

    .line 103
    .line 104
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1, p0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    int-to-float v1, v1

    .line 113
    const/4 v2, 0x0

    .line 114
    aput v1, v0, v2

    .line 115
    .line 116
    iget-object p1, p1, Lcom/android/launcher3/F1;->M0:[F

    .line 117
    .line 118
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {p2, p0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    int-to-float p0, p0

    .line 127
    const/4 p2, 0x1

    .line 128
    aput p0, p1, p2

    .line 129
    .line 130
    return-void
.end method

.method public B(Landroid/content/Context;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->l1()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->K0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x1

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const-string v0, "config_circle_scroll_status_internal"

    .line 18
    .line 19
    invoke-static {p1, v0, p0}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ne p0, v2, :cond_1

    .line 24
    .line 25
    :goto_0
    move v1, v2

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    const-string p0, "config_circle_scroll_status"

    .line 28
    .line 29
    invoke-static {p1, p0, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-ne p0, v2, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    :goto_1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const v0, 0x7f1403ac

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p0, p1, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0
.end method

.method public C(Landroid/content/Context;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1403ad

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->v:Z

    .line 13
    .line 14
    invoke-interface {v0, p1, p0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public D(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->p:Z

    .line 2
    .line 3
    return-void
.end method

.method public E(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->t:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->M3(Z)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v0, "setCircleScrollSwitch--circleScrollSwitch:"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "MFVInvariantDProfile"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public F(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->w()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "MFVInvariantDProfile"

    .line 6
    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->s:Z

    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Lcom/android/launcher3/V4;->initParentViews(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    const-string v0, "setCustomPageSwitch easeJustShowMiBoardQuickCall --customPageSwitch:"

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->s:Z

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz p0, :cond_2

    .line 69
    .line 70
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2;->r4(Z)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    const-string v0, "setCustomPageSwitch--customPageSwitch:"

    .line 84
    .line 85
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public G(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "setDesktopClockState: send needShow: "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", style: "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "MFVInvariantDProfile"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/android/launcher3/r4;->l:Z

    .line 35
    .line 36
    if-eq v0, p2, :cond_1

    .line 37
    .line 38
    iput-boolean p2, p0, Lcom/android/launcher3/r4;->l:Z

    .line 39
    .line 40
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const v1, 0x7f1403af

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 60
    .line 61
    .line 62
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    const-string v1, "desktop_clock_style"

    .line 69
    .line 70
    if-nez v0, :cond_2

    .line 71
    .line 72
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_2

    .line 77
    .line 78
    iput-object p3, p0, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-interface {p0, v1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 93
    .line 94
    .line 95
    :cond_2
    new-instance p0, Landroid/content/Intent;

    .line 96
    .line 97
    const-string v0, "com.android.mifavor.launcher.DESKTOP_CLOCK_STATE"

    .line 98
    .line 99
    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    const-string v0, "desktop_clock_state"

    .line 103
    .line 104
    invoke-virtual {p0, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p0, p2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 115
    .line 116
    .line 117
    invoke-virtual {p1, p0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method public H(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->j:Z

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/nubia/c;->p(Lcom/android/launcher3/C2;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v0, "setFancyIconStatus--fancyIconStatus:"

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "MFVInvariantDProfile"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public I(Landroid/content/Context;Z)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Lcom/android/launcher3/r4;->k:Z

    .line 2
    .line 3
    invoke-static {p1}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "icon_no_title"

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public J(Landroid/content/Context;F)V
    .locals 1

    .line 1
    iput p2, p0, Lcom/android/launcher3/r4;->n:F

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/r4;->r()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/android/launcher3/r4;->o:F

    .line 8
    .line 9
    invoke-static {p1}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "icon_size_percentage"

    .line 18
    .line 19
    invoke-interface {p0, p1, p2}, Landroid/content/SharedPreferences$Editor;->putFloat(Ljava/lang/String;F)Landroid/content/SharedPreferences$Editor;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public K(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public L(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/r4;->q:I

    .line 2
    .line 3
    return-void
.end method

.method public M(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public N(Lcom/android/launcher3/C2;I)V
    .locals 3

    .line 1
    const/16 v0, 0x8

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-ne p2, v0, :cond_0

    .line 5
    .line 6
    move p2, v1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p2, 0x1

    .line 9
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v2, "updatePreferenceAndRecreateControllers slideToOpenWhat= "

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v2, p0, Lcom/android/launcher3/r4;->q:I

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v2, ", currentSlideToOpenWhat="

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-string v2, "MFVInvariantDProfile"

    .line 37
    .line 38
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget v0, p0, Lcom/android/launcher3/r4;->q:I

    .line 42
    .line 43
    if-eq v0, p2, :cond_2

    .line 44
    .line 45
    if-nez p2, :cond_1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    const v0, 0x7f1403bb

    .line 53
    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget v1, p0, Lcom/android/launcher3/r4;->r:I

    .line 60
    .line 61
    invoke-interface {p2, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    :goto_1
    invoke-virtual {p0, v1}, Lcom/android/launcher3/r4;->L(I)V

    .line 66
    .line 67
    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/DragLayer;->recreateControllers()V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method public O(Landroid/content/Context;)I
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1403ae

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget v1, p0, Lcom/android/launcher3/r4;->x:I

    .line 13
    .line 14
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/android/launcher3/r4;->y:I

    .line 19
    .line 20
    const-string p1, "com.zte.mifavor.globalzboard"

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget p1, p0, Lcom/android/launcher3/r4;->y:I

    .line 28
    .line 29
    sget v0, Lcom/android/launcher3/settings/CustomPageSelectionLayoutActivity;->L:I

    .line 30
    .line 31
    if-eq p1, v0, :cond_0

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x0

    .line 36
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->s:Z

    .line 37
    .line 38
    return p1
.end method

.method public P(Landroid/content/Context;)I
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1403b7

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget v1, p0, Lcom/android/launcher3/r4;->o0:I

    .line 13
    .line 14
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    iput p1, p0, Lcom/android/launcher3/r4;->p0:I

    .line 19
    .line 20
    return p1
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/r4;->u0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->x0:Z

    .line 2
    .line 3
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/r4;->v0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->w0:Z

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->y0:Z

    .line 2
    .line 3
    return p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/r4;->t0:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Landroid/content/ComponentName;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/r4;->b0:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/r4;->r0:I

    .line 2
    .line 3
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->v:Z

    .line 2
    .line 3
    return p0
.end method

.method public o()F
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const-string p0, "MFVInvariantDProfile"

    .line 12
    .line 13
    const-string v0, "getIconSizePercentage return 2.0f"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    const/high16 p0, 0x40000000    # 2.0f

    .line 19
    .line 20
    return p0

    .line 21
    :cond_0
    iget p0, p0, Lcom/android/launcher3/r4;->n:F

    .line 22
    .line 23
    return p0
.end method

.method public p()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/r4;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->h:Z

    .line 2
    .line 3
    return p0
.end method

.method public t(Lcom/android/launcher3/F1;Landroid/content/Context;Landroid/util/DisplayMetrics;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f070ab4

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const v2, 0x7f070ab3

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iput v0, p0, Lcom/android/launcher3/r4;->N:I

    .line 28
    .line 29
    int-to-float v0, v0

    .line 30
    iget v1, p3, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->j(FI)F

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    float-to-int v0, v0

    .line 37
    iput v0, p0, Lcom/android/launcher3/r4;->N:I

    .line 38
    .line 39
    const-string v0, "config_custom_show_concern_mode"

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    const/4 v2, 0x1

    .line 47
    if-ne v0, v2, :cond_0

    .line 48
    .line 49
    move v0, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move v0, v1

    .line 52
    :goto_0
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->i0:Z

    .line 53
    .line 54
    const-string v0, "config_custom_show_standard_mode"

    .line 55
    .line 56
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-ne v0, v2, :cond_1

    .line 61
    .line 62
    move v0, v2

    .line 63
    goto :goto_1

    .line 64
    :cond_1
    move v0, v1

    .line 65
    :goto_1
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->j0:Z

    .line 66
    .line 67
    const-string v0, "config_custom_show_feature_phone_mode"

    .line 68
    .line 69
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-ne v0, v2, :cond_2

    .line 74
    .line 75
    move v0, v2

    .line 76
    goto :goto_2

    .line 77
    :cond_2
    move v0, v1

    .line 78
    :goto_2
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->k0:Z

    .line 79
    .line 80
    const-string v0, "config_can_not_delete_widget"

    .line 81
    .line 82
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-ne v0, v2, :cond_3

    .line 87
    .line 88
    move v0, v2

    .line 89
    goto :goto_3

    .line 90
    :cond_3
    move v0, v1

    .line 91
    :goto_3
    iput-boolean v0, p0, Lcom/android/launcher3/r4;->l0:Z

    .line 92
    .line 93
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/r4;->a(Lcom/android/launcher3/F1;Landroid/content/Context;Landroid/util/DisplayMetrics;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    const v0, 0x7f070382

    .line 101
    .line 102
    .line 103
    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    iput p3, p0, Lcom/android/launcher3/r4;->S:I

    .line 108
    .line 109
    invoke-direct {p0}, Lcom/android/launcher3/r4;->u()V

    .line 110
    .line 111
    .line 112
    invoke-static {p2}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 113
    .line 114
    .line 115
    move-result-object p3

    .line 116
    const-string v0, "icon_size_percentage"

    .line 117
    .line 118
    const/high16 v3, 0x3f800000    # 1.0f

    .line 119
    .line 120
    invoke-interface {p3, v0, v3}, Landroid/content/SharedPreferences;->getFloat(Ljava/lang/String;F)F

    .line 121
    .line 122
    .line 123
    move-result p3

    .line 124
    iput p3, p0, Lcom/android/launcher3/r4;->n:F

    .line 125
    .line 126
    invoke-direct {p0}, Lcom/android/launcher3/r4;->r()F

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    iput p3, p0, Lcom/android/launcher3/r4;->o:F

    .line 131
    .line 132
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 133
    .line 134
    .line 135
    move-result-object p3

    .line 136
    invoke-virtual {p3}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 137
    .line 138
    .line 139
    move-result-object p3

    .line 140
    const/4 v0, 0x0

    .line 141
    invoke-virtual {p3, p2, p1, v0}, Lcom/android/launcher3/b0;->n(Landroid/content/Context;Lcom/android/launcher3/F1;Ljava/lang/Boolean;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 145
    .line 146
    .line 147
    move-result-object p3

    .line 148
    invoke-virtual {p3}, Lcom/android/launcher3/H5;->H()Lcom/android/launcher3/b0;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    invoke-virtual {p3, p2}, Lcom/android/launcher3/b0;->i(Landroid/content/Context;)Landroid/graphics/Point;

    .line 153
    .line 154
    .line 155
    move-result-object p3

    .line 156
    if-eqz p3, :cond_4

    .line 157
    .line 158
    iget v0, p3, Landroid/graphics/Point;->x:I

    .line 159
    .line 160
    iput v0, p1, Lcom/android/launcher3/F1;->G0:I

    .line 161
    .line 162
    iget p3, p3, Landroid/graphics/Point;->y:I

    .line 163
    .line 164
    iput p3, p1, Lcom/android/launcher3/F1;->H0:I

    .line 165
    .line 166
    :cond_4
    const-string p1, "config_custom_jianyi_only_show_miboard_quickcall"

    .line 167
    .line 168
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    if-ne p1, v2, :cond_5

    .line 173
    .line 174
    move p1, v2

    .line 175
    goto :goto_4

    .line 176
    :cond_5
    move p1, v1

    .line 177
    :goto_4
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->c0:Z

    .line 178
    .line 179
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->H0()Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_6

    .line 188
    .line 189
    sget-object p1, Lcom/android/launcher3/r4;->A0:Ljava/lang/String;

    .line 190
    .line 191
    invoke-static {p2, p1}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_7

    .line 196
    .line 197
    :cond_6
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->J0()Z

    .line 202
    .line 203
    .line 204
    move-result p1

    .line 205
    if-eqz p1, :cond_9

    .line 206
    .line 207
    :cond_7
    const-string p1, "config_custom_page_status"

    .line 208
    .line 209
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-ne p1, v2, :cond_8

    .line 214
    .line 215
    move p1, v2

    .line 216
    goto :goto_5

    .line 217
    :cond_8
    move p1, v1

    .line 218
    :goto_5
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->v:Z

    .line 219
    .line 220
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    const p3, 0x7f1403ad

    .line 225
    .line 226
    .line 227
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p3

    .line 231
    iget-boolean v0, p0, Lcom/android/launcher3/r4;->v:Z

    .line 232
    .line 233
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->s:Z

    .line 238
    .line 239
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->w()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-eqz p1, :cond_9

    .line 244
    .line 245
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->v:Z

    .line 246
    .line 247
    iput-boolean v2, p0, Lcom/android/launcher3/r4;->s:Z

    .line 248
    .line 249
    :cond_9
    const-string p1, "config_show_custom_page_switch"

    .line 250
    .line 251
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    if-ne p1, v2, :cond_a

    .line 256
    .line 257
    move p1, v2

    .line 258
    goto :goto_6

    .line 259
    :cond_a
    move p1, v1

    .line 260
    :goto_6
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->w:Z

    .line 261
    .line 262
    const-string p1, "config_show_circle_scroll_switch"

    .line 263
    .line 264
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    if-ne p1, v2, :cond_b

    .line 269
    .line 270
    move p1, v2

    .line 271
    goto :goto_7

    .line 272
    :cond_b
    move p1, v1

    .line 273
    :goto_7
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->z:Z

    .line 274
    .line 275
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    const p3, 0x7f1403b4

    .line 280
    .line 281
    .line 282
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p3

    .line 286
    const-string v0, "config_screen_lock_status"

    .line 287
    .line 288
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-ne v0, v2, :cond_c

    .line 293
    .line 294
    move v0, v2

    .line 295
    goto :goto_8

    .line 296
    :cond_c
    move v0, v1

    .line 297
    :goto_8
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->h:Z

    .line 302
    .line 303
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    const p3, 0x7f1403bd

    .line 308
    .line 309
    .line 310
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 311
    .line 312
    .line 313
    move-result-object p3

    .line 314
    invoke-static {}, Lx1/O;->x3()Z

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    xor-int/2addr v0, v2

    .line 319
    const-string v3, "config_unlock_animation_default_status"

    .line 320
    .line 321
    invoke-static {p2, v3, v0}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    if-ne v0, v2, :cond_d

    .line 326
    .line 327
    move v0, v2

    .line 328
    goto :goto_9

    .line 329
    :cond_d
    move v0, v1

    .line 330
    :goto_9
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 331
    .line 332
    .line 333
    move-result p1

    .line 334
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->u:Z

    .line 335
    .line 336
    const-string p1, "config_sub_system_internet_function"

    .line 337
    .line 338
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    if-ne p1, v2, :cond_e

    .line 343
    .line 344
    move p1, v2

    .line 345
    goto :goto_a

    .line 346
    :cond_e
    move p1, v1

    .line 347
    :goto_a
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->e0:Z

    .line 348
    .line 349
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 350
    .line 351
    .line 352
    move-result-object p1

    .line 353
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->y0()Z

    .line 354
    .line 355
    .line 356
    move-result p1

    .line 357
    if-eqz p1, :cond_f

    .line 358
    .line 359
    iget-boolean p1, p0, Lcom/android/launcher3/r4;->e0:Z

    .line 360
    .line 361
    if-eqz p1, :cond_12

    .line 362
    .line 363
    :cond_f
    const-string p1, "config_fancy_icon_disable"

    .line 364
    .line 365
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 366
    .line 367
    .line 368
    move-result p1

    .line 369
    if-ne p1, v2, :cond_10

    .line 370
    .line 371
    move p1, v2

    .line 372
    goto :goto_b

    .line 373
    :cond_10
    move p1, v1

    .line 374
    :goto_b
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->i:Z

    .line 375
    .line 376
    invoke-static {p2}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    const p3, 0x7f1403b1

    .line 381
    .line 382
    .line 383
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object p3

    .line 387
    const-string v0, "config_fancy_icon_status"

    .line 388
    .line 389
    invoke-static {p2, v0, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-ne v0, v2, :cond_11

    .line 394
    .line 395
    move v0, v2

    .line 396
    goto :goto_c

    .line 397
    :cond_11
    move v0, v1

    .line 398
    :goto_c
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 399
    .line 400
    .line 401
    move-result p1

    .line 402
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->j:Z

    .line 403
    .line 404
    :cond_12
    invoke-static {p2}, Lcom/android/launcher3/J3;->j(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 405
    .line 406
    .line 407
    move-result-object p1

    .line 408
    const-string p3, "config_icon_no_title"

    .line 409
    .line 410
    invoke-static {p2, p3, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 411
    .line 412
    .line 413
    move-result p3

    .line 414
    if-ne p3, v2, :cond_13

    .line 415
    .line 416
    move p3, v2

    .line 417
    goto :goto_d

    .line 418
    :cond_13
    move p3, v1

    .line 419
    :goto_d
    const-string v0, "icon_no_title"

    .line 420
    .line 421
    invoke-interface {p1, v0, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->k:Z

    .line 426
    .line 427
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 428
    .line 429
    .line 430
    move-result-object p1

    .line 431
    const p3, 0x7f1403a6

    .line 432
    .line 433
    .line 434
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object p3

    .line 438
    const-string v0, "config_auto_align_status"

    .line 439
    .line 440
    invoke-static {p2, v0, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 441
    .line 442
    .line 443
    move-result v0

    .line 444
    if-ne v0, v2, :cond_14

    .line 445
    .line 446
    move v0, v2

    .line 447
    goto :goto_e

    .line 448
    :cond_14
    move v0, v1

    .line 449
    :goto_e
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 450
    .line 451
    .line 452
    move-result p1

    .line 453
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->p:Z

    .line 454
    .line 455
    const-string p1, "config_sild_to_open_search"

    .line 456
    .line 457
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    iput p1, p0, Lcom/android/launcher3/r4;->r:I

    .line 462
    .line 463
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 464
    .line 465
    .line 466
    move-result-object p1

    .line 467
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->y0()Z

    .line 468
    .line 469
    .line 470
    move-result p1

    .line 471
    if-eqz p1, :cond_15

    .line 472
    .line 473
    iget-boolean p1, p0, Lcom/android/launcher3/r4;->e0:Z

    .line 474
    .line 475
    if-nez p1, :cond_15

    .line 476
    .line 477
    iput v1, p0, Lcom/android/launcher3/r4;->q:I

    .line 478
    .line 479
    goto :goto_10

    .line 480
    :cond_15
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 481
    .line 482
    .line 483
    move-result-object p1

    .line 484
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 485
    .line 486
    .line 487
    move-result p1

    .line 488
    if-eqz p1, :cond_16

    .line 489
    .line 490
    iput v1, p0, Lcom/android/launcher3/r4;->q:I

    .line 491
    .line 492
    goto :goto_10

    .line 493
    :cond_16
    const-string p1, "com.zte.mifavor.zsearch"

    .line 494
    .line 495
    invoke-static {p2, p1}, Lx1/O;->h1(Landroid/content/Context;Ljava/lang/String;)Z

    .line 496
    .line 497
    .line 498
    move-result p1

    .line 499
    if-eqz p1, :cond_17

    .line 500
    .line 501
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 502
    .line 503
    .line 504
    move-result-object p1

    .line 505
    const p3, 0x7f1403bb

    .line 506
    .line 507
    .line 508
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 509
    .line 510
    .line 511
    move-result-object p3

    .line 512
    iget v0, p0, Lcom/android/launcher3/r4;->r:I

    .line 513
    .line 514
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    .line 515
    .line 516
    .line 517
    move-result p1

    .line 518
    goto :goto_f

    .line 519
    :cond_17
    move p1, v1

    .line 520
    :goto_f
    iput p1, p0, Lcom/android/launcher3/r4;->q:I

    .line 521
    .line 522
    :goto_10
    invoke-static {p2}, Lcom/android/launcher3/H5;->T(Landroid/content/Context;)Lcom/android/launcher3/H5;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->K0()Z

    .line 527
    .line 528
    .line 529
    move-result p1

    .line 530
    if-nez p1, :cond_18

    .line 531
    .line 532
    iget-boolean p1, p0, Lcom/android/launcher3/r4;->s:Z

    .line 533
    .line 534
    if-eqz p1, :cond_18

    .line 535
    .line 536
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->t:Z

    .line 537
    .line 538
    goto :goto_11

    .line 539
    :cond_18
    invoke-virtual {p0, p2}, Lcom/android/launcher3/r4;->B(Landroid/content/Context;)Z

    .line 540
    .line 541
    .line 542
    move-result p1

    .line 543
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->t:Z

    .line 544
    .line 545
    :goto_11
    const-string p1, "config_miboard_responds_back_key"

    .line 546
    .line 547
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 548
    .line 549
    .line 550
    move-result p1

    .line 551
    if-ne p1, v2, :cond_19

    .line 552
    .line 553
    move p1, v2

    .line 554
    goto :goto_12

    .line 555
    :cond_19
    move p1, v1

    .line 556
    :goto_12
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->C:Z

    .line 557
    .line 558
    const-string p1, "config_miboard_replace_switch_wording"

    .line 559
    .line 560
    invoke-static {p2, p1}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p1

    .line 564
    iput-object p1, p0, Lcom/android/launcher3/r4;->D:Ljava/lang/String;

    .line 565
    .line 566
    const-string p1, "config_show_desktop_grid_switch"

    .line 567
    .line 568
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 569
    .line 570
    .line 571
    move-result p1

    .line 572
    if-ne p1, v2, :cond_1a

    .line 573
    .line 574
    move p1, v2

    .line 575
    goto :goto_13

    .line 576
    :cond_1a
    move p1, v1

    .line 577
    :goto_13
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->F:Z

    .line 578
    .line 579
    const-string p1, "config_show_contact_page_indicator"

    .line 580
    .line 581
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 582
    .line 583
    .line 584
    move-result p1

    .line 585
    if-ne p1, v2, :cond_1b

    .line 586
    .line 587
    move p1, v2

    .line 588
    goto :goto_14

    .line 589
    :cond_1b
    move p1, v1

    .line 590
    :goto_14
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->G:Z

    .line 591
    .line 592
    const-string p1, "config_show_fast_scroller_bar"

    .line 593
    .line 594
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 595
    .line 596
    .line 597
    move-result p1

    .line 598
    if-ne p1, v2, :cond_1c

    .line 599
    .line 600
    move p1, v2

    .line 601
    goto :goto_15

    .line 602
    :cond_1c
    move p1, v1

    .line 603
    :goto_15
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->H:Z

    .line 604
    .line 605
    const-string p1, "config_relax_folder_recommend_elder"

    .line 606
    .line 607
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 608
    .line 609
    .line 610
    move-result p1

    .line 611
    if-ne p1, v2, :cond_1d

    .line 612
    .line 613
    move p1, v2

    .line 614
    goto :goto_16

    .line 615
    :cond_1d
    move p1, v1

    .line 616
    :goto_16
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->I:Z

    .line 617
    .line 618
    const-string p1, "config_setting_ambiguity_menu_no_theme"

    .line 619
    .line 620
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 621
    .line 622
    .line 623
    move-result p1

    .line 624
    if-ne p1, v2, :cond_1e

    .line 625
    .line 626
    move p1, v2

    .line 627
    goto :goto_17

    .line 628
    :cond_1e
    move p1, v1

    .line 629
    :goto_17
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->J:Z

    .line 630
    .line 631
    const-string p1, "config_resize_google_search_widget"

    .line 632
    .line 633
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 634
    .line 635
    .line 636
    move-result p1

    .line 637
    if-ne p1, v2, :cond_1f

    .line 638
    .line 639
    move p1, v2

    .line 640
    goto :goto_18

    .line 641
    :cond_1f
    move p1, v1

    .line 642
    :goto_18
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->K:Z

    .line 643
    .line 644
    const-string p1, "config_custom_icon_clip"

    .line 645
    .line 646
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 647
    .line 648
    .line 649
    move-result p1

    .line 650
    if-ne p1, v2, :cond_20

    .line 651
    .line 652
    move p1, v2

    .line 653
    goto :goto_19

    .line 654
    :cond_20
    move p1, v1

    .line 655
    :goto_19
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->Y:Z

    .line 656
    .line 657
    const-string p1, "config_preferencezte_left_right_style"

    .line 658
    .line 659
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 660
    .line 661
    .line 662
    move-result p1

    .line 663
    if-ne p1, v2, :cond_21

    .line 664
    .line 665
    move p1, v2

    .line 666
    goto :goto_1a

    .line 667
    :cond_21
    move p1, v1

    .line 668
    :goto_1a
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->Z:Z

    .line 669
    .line 670
    const-string p1, "config_custom_menu_item_title_color"

    .line 671
    .line 672
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 673
    .line 674
    .line 675
    move-result p1

    .line 676
    if-ne p1, v2, :cond_22

    .line 677
    .line 678
    move p1, v2

    .line 679
    goto :goto_1b

    .line 680
    :cond_22
    move p1, v1

    .line 681
    :goto_1b
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->d0:Z

    .line 682
    .line 683
    const-string p1, "config_custom_show_home_screen_mode"

    .line 684
    .line 685
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 686
    .line 687
    .line 688
    move-result p1

    .line 689
    if-ne p1, v2, :cond_23

    .line 690
    .line 691
    move p1, v2

    .line 692
    goto :goto_1c

    .line 693
    :cond_23
    move p1, v1

    .line 694
    :goto_1c
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->a0:Z

    .line 695
    .line 696
    invoke-direct {p0, p2}, Lcom/android/launcher3/r4;->s(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 697
    .line 698
    .line 699
    move-result-object p1

    .line 700
    iput-object p1, p0, Lcom/android/launcher3/r4;->b0:Ljava/util/ArrayList;

    .line 701
    .line 702
    const-string p1, "config_wallpaper_entrance_component_name"

    .line 703
    .line 704
    invoke-static {p2, p1}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 705
    .line 706
    .line 707
    move-result-object p1

    .line 708
    iput-object p1, p0, Lcom/android/launcher3/r4;->L:Ljava/lang/String;

    .line 709
    .line 710
    invoke-static {}, Lx1/O;->C2()Z

    .line 711
    .line 712
    .line 713
    move-result p1

    .line 714
    if-eqz p1, :cond_24

    .line 715
    .line 716
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 717
    .line 718
    .line 719
    move-result p1

    .line 720
    if-eqz p1, :cond_25

    .line 721
    .line 722
    :cond_24
    invoke-static {}, Lx1/O;->v3()Z

    .line 723
    .line 724
    .line 725
    move-result p1

    .line 726
    if-eqz p1, :cond_25

    .line 727
    .line 728
    invoke-static {}, Lx1/O;->l2()Z

    .line 729
    .line 730
    .line 731
    move-result p1

    .line 732
    if-nez p1, :cond_25

    .line 733
    .line 734
    move p1, v2

    .line 735
    goto :goto_1d

    .line 736
    :cond_25
    move p1, v1

    .line 737
    :goto_1d
    const-string p3, "config_enable_split"

    .line 738
    .line 739
    invoke-static {p2, p3, p1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 740
    .line 741
    .line 742
    move-result p1

    .line 743
    if-ne p1, v2, :cond_26

    .line 744
    .line 745
    move p1, v2

    .line 746
    goto :goto_1e

    .line 747
    :cond_26
    move p1, v1

    .line 748
    :goto_1e
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->f0:Z

    .line 749
    .line 750
    const-string p1, "config_open_app_not_close_foler"

    .line 751
    .line 752
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 753
    .line 754
    .line 755
    move-result p1

    .line 756
    if-ne p1, v2, :cond_27

    .line 757
    .line 758
    move p1, v2

    .line 759
    goto :goto_1f

    .line 760
    :cond_27
    move p1, v1

    .line 761
    :goto_1f
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->g0:Z

    .line 762
    .line 763
    const-string p1, "config_notch_screen"

    .line 764
    .line 765
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 766
    .line 767
    .line 768
    move-result p1

    .line 769
    if-ne p1, v2, :cond_28

    .line 770
    .line 771
    move p1, v2

    .line 772
    goto :goto_20

    .line 773
    :cond_28
    move p1, v1

    .line 774
    :goto_20
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->h0:Z

    .line 775
    .line 776
    const-string p1, "config_switch_system_icon_pinned"

    .line 777
    .line 778
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 779
    .line 780
    .line 781
    move-result p1

    .line 782
    if-ne p1, v2, :cond_29

    .line 783
    .line 784
    move p1, v2

    .line 785
    goto :goto_21

    .line 786
    :cond_29
    move p1, v1

    .line 787
    :goto_21
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->q0:Z

    .line 788
    .line 789
    const-string p1, "config_all_app_sort_mode"

    .line 790
    .line 791
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 792
    .line 793
    .line 794
    move-result p1

    .line 795
    iput p1, p0, Lcom/android/launcher3/r4;->r0:I

    .line 796
    .line 797
    const-string p1, "config_bestie_tv_widget_4x2_color"

    .line 798
    .line 799
    invoke-static {p2, p1}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 800
    .line 801
    .line 802
    move-result-object p1

    .line 803
    iput-object p1, p0, Lcom/android/launcher3/r4;->t0:Ljava/lang/String;

    .line 804
    .line 805
    const-string p1, "config_bestie_computer_widget_color"

    .line 806
    .line 807
    invoke-static {p2, p1}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 808
    .line 809
    .line 810
    move-result-object p1

    .line 811
    iput-object p1, p0, Lcom/android/launcher3/r4;->u0:Ljava/lang/String;

    .line 812
    .line 813
    const-string p1, "config_bestie_music_widget_color"

    .line 814
    .line 815
    invoke-static {p2, p1}, Lcom/android/launcher3/v4;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 816
    .line 817
    .line 818
    move-result-object p1

    .line 819
    iput-object p1, p0, Lcom/android/launcher3/r4;->v0:Ljava/lang/String;

    .line 820
    .line 821
    const-string p1, "config_bestie_need_card_page_screen"

    .line 822
    .line 823
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 824
    .line 825
    .line 826
    move-result p1

    .line 827
    if-ne p1, v2, :cond_2a

    .line 828
    .line 829
    move p1, v2

    .line 830
    goto :goto_22

    .line 831
    :cond_2a
    move p1, v1

    .line 832
    :goto_22
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->w0:Z

    .line 833
    .line 834
    const-string p1, "config_bestie_cu_uniform_style"

    .line 835
    .line 836
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 837
    .line 838
    .line 839
    move-result p1

    .line 840
    if-ne p1, v2, :cond_2b

    .line 841
    .line 842
    move p1, v2

    .line 843
    goto :goto_23

    .line 844
    :cond_2b
    move p1, v1

    .line 845
    :goto_23
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->x0:Z

    .line 846
    .line 847
    const-string p1, "config_bestie_need_family_video_mode"

    .line 848
    .line 849
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 850
    .line 851
    .line 852
    move-result p1

    .line 853
    if-ne p1, v2, :cond_2c

    .line 854
    .line 855
    move p1, v2

    .line 856
    goto :goto_24

    .line 857
    :cond_2c
    move p1, v1

    .line 858
    :goto_24
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->y0:Z

    .line 859
    .line 860
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 861
    .line 862
    .line 863
    move-result-object p1

    .line 864
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->p()Z

    .line 865
    .line 866
    .line 867
    move-result p1

    .line 868
    if-eqz p1, :cond_2d

    .line 869
    .line 870
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 871
    .line 872
    .line 873
    move-result-object p1

    .line 874
    const p3, 0x7f1403af

    .line 875
    .line 876
    .line 877
    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 878
    .line 879
    .line 880
    move-result-object p3

    .line 881
    invoke-interface {p1, p3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 882
    .line 883
    .line 884
    move-result p1

    .line 885
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->l:Z

    .line 886
    .line 887
    invoke-static {p2}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 888
    .line 889
    .line 890
    move-result-object p1

    .line 891
    const-string p3, "desktop_clock_style"

    .line 892
    .line 893
    const-string v0, "pointer_clock_default"

    .line 894
    .line 895
    invoke-interface {p1, p3, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 896
    .line 897
    .line 898
    move-result-object p1

    .line 899
    iput-object p1, p0, Lcom/android/launcher3/r4;->m:Ljava/lang/String;

    .line 900
    .line 901
    :cond_2d
    const-string p1, "config_change_folder_bg_when_dark_mode"

    .line 902
    .line 903
    invoke-static {p2, p1, v2}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 904
    .line 905
    .line 906
    move-result p1

    .line 907
    if-ne p1, v2, :cond_2e

    .line 908
    .line 909
    move p1, v2

    .line 910
    goto :goto_25

    .line 911
    :cond_2e
    move p1, v1

    .line 912
    :goto_25
    iput-boolean p1, p0, Lcom/android/launcher3/r4;->s0:Z

    .line 913
    .line 914
    invoke-direct {p0, p2}, Lcom/android/launcher3/r4;->i(Landroid/content/Context;)Ljava/util/ArrayList;

    .line 915
    .line 916
    .line 917
    move-result-object p1

    .line 918
    iput-object p1, p0, Lcom/android/launcher3/r4;->z0:Ljava/util/ArrayList;

    .line 919
    .line 920
    const-string p1, "config_support_replace_dialer_by_xingxiaochen"

    .line 921
    .line 922
    invoke-static {p2, p1, v1}, Lcom/android/launcher3/v4;->b(Landroid/content/Context;Ljava/lang/String;I)I

    .line 923
    .line 924
    .line 925
    move-result p1

    .line 926
    if-ne p1, v2, :cond_2f

    .line 927
    .line 928
    move v1, v2

    .line 929
    :cond_2f
    iput-boolean v1, p0, Lcom/android/launcher3/r4;->m0:Z

    .line 930
    .line 931
    return-void
.end method

.method public w()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/r4;->c0:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public x(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->i5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/r4;->v()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/r4;->z0:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/content/ComponentName;

    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_1

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_2
    :goto_0
    return v1
.end method

.method public y(Landroid/content/ComponentName;Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {}, Lx1/O;->i5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/r4;->z(Landroid/content/ComponentName;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p2, p0}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public z(Landroid/content/ComponentName;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->i5()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/r4;->v()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/r4;->z0:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    return v1
.end method
