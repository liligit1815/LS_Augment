.class public final Lcom/android/launcher3/taskbar/s;
.super Ljava/lang/Object;
.source "KeyboardQuickSwitchController.java"

# interfaces
.implements Lcom/android/launcher3/taskbar/R1$b;
.implements Lcom/android/launcher3/util/G2;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/taskbar/s$a;
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/taskbar/s$a;

.field private h:Ljava/lang/Runnable;

.field private i:Lcom/android/quickstep/RecentsModel;

.field private j:I

.field private k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;"
        }
    .end annotation
.end field

.field private l:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private m:I

.field private n:Lcom/android/launcher3/taskbar/R1;

.field private o:Lcom/android/launcher3/taskbar/L;

.field private p:La2/a;

.field private q:Z

.field private r:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/taskbar/s$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/s$a;-><init>(Lcom/android/launcher3/taskbar/s;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/taskbar/s;->g:Lcom/android/launcher3/taskbar/s$a;

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Lcom/android/launcher3/taskbar/s;->j:I

    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 20
    .line 21
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 31
    .line 32
    return-void
.end method

.method private synthetic A(Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/taskbar/s;->L(Lcom/android/quickstep/util/GroupTask;Ljava/util/Set;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method private synthetic B(Ljava/util/Set;Lcom/android/quickstep/util/GroupTask;)Z
    .locals 1

    .line 1
    instance-of v0, p2, Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/taskbar/s;->L(Lcom/android/quickstep/util/GroupTask;Ljava/util/Set;)Z

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

.method private G(I)V
    .locals 2

    .line 1
    sget-object v0, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/taskbar/s;->H(ILjava/util/Set;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method private H(ILjava/util/Set;Z)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/L;->n()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_5

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/L;->z()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-ne v0, p3, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->g:Lcom/android/launcher3/taskbar/s$a;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/s$a;->e()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    move p1, v2

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 34
    .line 35
    iget v1, p0, Lcom/android/launcher3/taskbar/s;->j:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/android/quickstep/RecentsModel;->isTaskListValid(I)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 44
    .line 45
    invoke-interface {p2, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_4

    .line 50
    .line 51
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/S1;->f()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 62
    .line 63
    new-instance v2, Lcom/android/launcher3/taskbar/h;

    .line 64
    .line 65
    invoke-direct {v2, p0, p2, p3, p1}, Lcom/android/launcher3/taskbar/h;-><init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZI)V

    .line 66
    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    sget-object p2, Lcom/android/quickstep/RecentsFilterState;->EMPTY_FILTER:Ljava/util/function/Predicate;

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-static {}, Lcom/android/quickstep/RecentsFilterState;->getDesktopTaskFilter()Ljava/util/function/Predicate;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    :goto_0
    invoke-virtual {v1, v2, p2}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;Ljava/util/function/Predicate;)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    iput p2, p0, Lcom/android/launcher3/taskbar/s;->j:I

    .line 82
    .line 83
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 84
    .line 85
    invoke-virtual {p0, p3, p1}, Lcom/android/launcher3/taskbar/L;->x(ZI)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_5
    invoke-virtual {p0, v2}, Lcom/android/launcher3/taskbar/s;->u(Z)V

    .line 90
    .line 91
    .line 92
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 93
    .line 94
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 95
    .line 96
    invoke-virtual {v0}, La2/e;->s()La2/a;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 101
    .line 102
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_7

    .line 107
    .line 108
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 109
    .line 110
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-virtual {v0, p0}, La2/h;->c(Lcom/android/launcher3/util/G2;)V

    .line 115
    .line 116
    .line 117
    :cond_7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget-object v3, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 124
    .line 125
    invoke-virtual {v3}, La2/a;->n()La2/h;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    const v4, 0x7f0e0115

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v4, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    check-cast v0, Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;

    .line 137
    .line 138
    new-instance v3, Lcom/android/launcher3/taskbar/L;

    .line 139
    .line 140
    iget-object v4, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 141
    .line 142
    iget-object v5, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 143
    .line 144
    iget-object v6, p0, Lcom/android/launcher3/taskbar/s;->g:Lcom/android/launcher3/taskbar/s$a;

    .line 145
    .line 146
    invoke-direct {v3, v4, v5, v0, v6}, Lcom/android/launcher3/taskbar/L;-><init>(Lcom/android/launcher3/taskbar/R1;La2/a;Lcom/android/launcher3/taskbar/KeyboardQuickSwitchView;Lcom/android/launcher3/taskbar/s$a;)V

    .line 147
    .line 148
    .line 149
    iput-object v3, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 150
    .line 151
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 152
    .line 153
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/S1;->f()Z

    .line 156
    .line 157
    .line 158
    move-result v8

    .line 159
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 160
    .line 161
    iget v3, p0, Lcom/android/launcher3/taskbar/s;->j:I

    .line 162
    .line 163
    invoke-virtual {v0, v3}, Lcom/android/quickstep/RecentsModel;->isTaskListValid(I)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 170
    .line 171
    invoke-interface {p2, v0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_a

    .line 176
    .line 177
    iget-object v3, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 178
    .line 179
    iget-object v4, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 180
    .line 181
    if-eqz p3, :cond_8

    .line 182
    .line 183
    move v5, v2

    .line 184
    goto :goto_1

    .line 185
    :cond_8
    iget p2, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 186
    .line 187
    move v5, p2

    .line 188
    :goto_1
    if-ne p1, v1, :cond_9

    .line 189
    .line 190
    iget-object p2, p0, Lcom/android/launcher3/taskbar/s;->g:Lcom/android/launcher3/taskbar/s$a;

    .line 191
    .line 192
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/s$a;->e()Z

    .line 193
    .line 194
    .line 195
    move-result p2

    .line 196
    if-nez p2, :cond_9

    .line 197
    .line 198
    move v7, v2

    .line 199
    goto :goto_2

    .line 200
    :cond_9
    move v7, p1

    .line 201
    :goto_2
    iget-boolean v9, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 202
    .line 203
    iget-boolean v10, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 204
    .line 205
    const/4 v6, 0x0

    .line 206
    move v11, p3

    .line 207
    invoke-virtual/range {v3 .. v11}, Lcom/android/launcher3/taskbar/L;->v(Ljava/util/List;IZIZZZZ)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :cond_a
    move v6, p3

    .line 212
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 213
    .line 214
    iget-object p3, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 215
    .line 216
    new-instance v3, Lcom/android/launcher3/taskbar/i;

    .line 217
    .line 218
    move-object v4, p0

    .line 219
    move v7, p1

    .line 220
    move-object v5, p2

    .line 221
    invoke-direct/range {v3 .. v8}, Lcom/android/launcher3/taskbar/i;-><init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZIZ)V

    .line 222
    .line 223
    .line 224
    if-eqz v8, :cond_b

    .line 225
    .line 226
    sget-object p0, Lcom/android/quickstep/RecentsFilterState;->EMPTY_FILTER:Ljava/util/function/Predicate;

    .line 227
    .line 228
    goto :goto_3

    .line 229
    :cond_b
    invoke-static {}, Lcom/android/quickstep/RecentsFilterState;->getDesktopTaskFilter()Ljava/util/function/Predicate;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    :goto_3
    invoke-virtual {p3, v3, p0}, Lcom/android/quickstep/RecentsModel;->getTasks(Ljava/util/function/Consumer;Ljava/util/function/Predicate;)I

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    iput p0, v4, Lcom/android/launcher3/taskbar/s;->j:I

    .line 238
    .line 239
    return-void
.end method

.method private I(Ljava/util/List;Ljava/util/Set;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->A:Lcom/android/launcher3/taskbar/S1;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/S1;->f()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->J(Ljava/util/List;Ljava/util/Set;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->K(Ljava/util/List;Ljava/util/Set;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private J(Ljava/util/List;Ljava/util/Set;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/taskbar/k;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/k;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/android/launcher3/taskbar/l;

    .line 15
    .line 16
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/l;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {}, Lcom/android/launcher3/y0;->h()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x0

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v3, Lcom/android/launcher3/taskbar/m;

    .line 39
    .line 40
    invoke-direct {v3}, Lcom/android/launcher3/taskbar/m;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v3, Lcom/android/launcher3/taskbar/n;

    .line 48
    .line 49
    invoke-direct {v3}, Lcom/android/launcher3/taskbar/n;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v3, Lcom/android/launcher3/taskbar/o;

    .line 57
    .line 58
    invoke-direct {v3, p0, p2}, Lcom/android/launcher3/taskbar/o;-><init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v1, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-interface {p2, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    check-cast p2, Ljava/util/List;

    .line 74
    .line 75
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    sub-int/2addr p1, p2

    .line 86
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iput p1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 91
    .line 92
    return-void

    .line 93
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_1

    .line 98
    .line 99
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Lcom/android/quickstep/util/DesktopTask;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    new-instance v1, Lcom/android/launcher3/taskbar/n;

    .line 114
    .line 115
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/n;-><init>()V

    .line 116
    .line 117
    .line 118
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    new-instance v1, Lcom/android/launcher3/taskbar/p;

    .line 123
    .line 124
    invoke-direct {v1, p0, p2}, Lcom/android/launcher3/taskbar/p;-><init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;)V

    .line 125
    .line 126
    .line 127
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 128
    .line 129
    .line 130
    move-result-object p2

    .line 131
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    check-cast p2, Ljava/util/List;

    .line 140
    .line 141
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 142
    .line 143
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    add-int/lit8 p1, p1, -0x1

    .line 148
    .line 149
    invoke-static {v2, p1}, Ljava/lang/Math;->max(II)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput p1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 154
    .line 155
    return-void

    .line 156
    :cond_1
    sget-object p2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 157
    .line 158
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 159
    .line 160
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    iput p1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 165
    .line 166
    return-void
.end method

.method private K(Ljava/util/List;Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/android/launcher3/taskbar/j;

    .line 9
    .line 10
    invoke-direct {v1, p0, p2}, Lcom/android/launcher3/taskbar/j;-><init>(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-wide/16 v0, 0x6

    .line 18
    .line 19
    invoke-interface {p2, v0, v1}, Ljava/util/stream/Stream;->limit(J)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Ljava/util/List;

    .line 32
    .line 33
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 34
    .line 35
    const/4 p2, 0x0

    .line 36
    move v0, p2

    .line 37
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-ge v0, v1, :cond_1

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    instance-of v1, v1, Lcom/android/quickstep/util/DesktopTask;

    .line 48
    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    const/4 v1, 0x1

    .line 52
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 53
    .line 54
    iget-object v2, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-ge v0, v2, :cond_1

    .line 61
    .line 62
    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 73
    .line 74
    sub-int/2addr p1, v0

    .line 75
    add-int/lit8 p1, p1, -0x6

    .line 76
    .line 77
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    iput p1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 82
    .line 83
    return-void
.end method

.method private L(Lcom/android/quickstep/util/GroupTask;Ljava/util/Set;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/quickstep/util/GroupTask;",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    new-instance p1, Lcom/android/launcher3/taskbar/g;

    .line 16
    .line 17
    invoke-direct {p1, p2}, Lcom/android/launcher3/taskbar/g;-><init>(Ljava/util/Set;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/s;IZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->w(IZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/quickstep/util/GroupTask;)Lcom/android/quickstep/util/DesktopTask;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic d(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZILjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/taskbar/s;->x(Ljava/util/Set;ZILjava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;ZIZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/taskbar/s;->y(Ljava/util/Set;ZIZLjava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->z(Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic g(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->A(Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic h(Lcom/android/launcher3/taskbar/s;Ljava/util/Set;Lcom/android/quickstep/util/GroupTask;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/s;->B(Ljava/util/Set;Lcom/android/quickstep/util/GroupTask;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic i(Ljava/util/Set;Lcom/android/systemui/shared/recents/model/Task;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 2
    .line 3
    iget p1, p1, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static synthetic j(Lcom/android/quickstep/util/DesktopTask;)Ljava/util/stream/Stream;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic k(Lcom/android/quickstep/util/GroupTask;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/quickstep/util/DesktopTask;

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/taskbar/s;)Lcom/android/launcher3/taskbar/R1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/taskbar/s;)Lcom/android/quickstep/RecentsModel;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/taskbar/s;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic o(Lcom/android/launcher3/taskbar/s;)La2/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic p(Lcom/android/launcher3/taskbar/s;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic q(Lcom/android/launcher3/taskbar/s;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic r(Lcom/android/launcher3/taskbar/s;La2/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic s(Lcom/android/launcher3/taskbar/s;Lcom/android/launcher3/taskbar/L;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    return-void
.end method

.method private synthetic w(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->l:Ljava/util/Set;

    .line 2
    .line 3
    invoke-direct {p0, p1, v0, p2}, Lcom/android/launcher3/taskbar/s;->H(ILjava/util/Set;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private synthetic x(Ljava/util/Set;ZILjava/util/List;)V
    .locals 6

    .line 1
    invoke-direct {p0, p4, p1}, Lcom/android/launcher3/taskbar/s;->I(Ljava/util/List;Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    :goto_0
    move v2, p1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    iget p1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :goto_1
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 17
    .line 18
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 19
    .line 20
    move v3, p3

    .line 21
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/taskbar/L;->y(Ljava/util/List;IIZZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic y(Ljava/util/Set;ZIZLjava/util/List;)V
    .locals 9

    .line 1
    invoke-direct {p0, p5, p1}, Lcom/android/launcher3/taskbar/s;->I(Ljava/util/List;Ljava/util/Set;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    if-eqz p2, :cond_0

    .line 10
    .line 11
    move v2, p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iget p5, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 14
    .line 15
    move v2, p5

    .line 16
    :goto_0
    const/4 p5, -0x1

    .line 17
    if-ne p3, p5, :cond_1

    .line 18
    .line 19
    iget-object p5, p0, Lcom/android/launcher3/taskbar/s;->g:Lcom/android/launcher3/taskbar/s$a;

    .line 20
    .line 21
    invoke-virtual {p5}, Lcom/android/launcher3/taskbar/s$a;->e()Z

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    if-nez p5, :cond_1

    .line 26
    .line 27
    move v4, p1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    move v4, p3

    .line 30
    :goto_1
    iget-boolean v6, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 31
    .line 32
    iget-boolean v7, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 33
    .line 34
    const/4 v3, 0x1

    .line 35
    move v8, p2

    .line 36
    move v5, p4

    .line 37
    invoke-virtual/range {v0 .. v8}, Lcom/android/launcher3/taskbar/L;->v(Ljava/util/List;IZIZZZZ)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method private synthetic z(Ljava/util/Set;Lcom/android/quickstep/util/SingleTask;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/taskbar/s;->L(Lcom/android/quickstep/util/GroupTask;Ljava/util/Set;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method


# virtual methods
.method C()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L;->r()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 22
    return p0
.end method

.method D(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    and-int/lit8 p1, p1, 0x30

    .line 7
    .line 8
    if-eqz p1, :cond_1

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    invoke-virtual {v0, p0}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/L;->m()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/L;->z()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/s;->E()V

    .line 26
    .line 27
    .line 28
    const/4 v1, -0x1

    .line 29
    if-eq p1, v1, :cond_2

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroid/view/ContextThemeWrapper;->getMainThreadHandler()Landroid/os/Handler;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    new-instance v2, Lcom/android/launcher3/taskbar/f;

    .line 40
    .line 41
    invoke-direct {v2, p0, p1, v0}, Lcom/android/launcher3/taskbar/f;-><init>(Lcom/android/launcher3/taskbar/s;IZ)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-void
.end method

.method E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/L;->u()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method F()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/s;->G(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method M(Ljava/util/Set;Ljava/lang/Runnable;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/lang/Runnable;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/taskbar/s;->h:Ljava/lang/Runnable;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/L;->n()Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-nez p2, :cond_0

    .line 13
    .line 14
    iget-object p2, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/android/launcher3/taskbar/L;->z()Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s;->u(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const/4 p2, -0x1

    .line 27
    invoke-direct {p0, p2, p1, v0}, Lcom/android/launcher3/taskbar/s;->H(ILjava/util/Set;Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public a(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "KeyboardQuickSwitchController:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v1, "\tisOpen="

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    const/4 v3, 0x1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    move v1, v3

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v1, v2

    .line 43
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, "\tmNumHiddenTasks="

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget v1, p0, Lcom/android/launcher3/taskbar/s;->m:I

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v1, "\tmTaskListChangeId="

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget v1, p0, Lcom/android/launcher3/taskbar/s;->j:I

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    new-instance v0, Ljava/lang/StringBuilder;

    .line 104
    .line 105
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const-string v1, "\tmHasDesktopTask="

    .line 112
    .line 113
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/s;->q:Z

    .line 117
    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    new-instance v0, Ljava/lang/StringBuilder;

    .line 129
    .line 130
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v1, "\tmWasDesktopTaskFilteredOut="

    .line 137
    .line 138
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/s;->r:Z

    .line 142
    .line 143
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    new-instance v0, Ljava/lang/StringBuilder;

    .line 154
    .line 155
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    const-string v1, "\tmTasks=["

    .line 162
    .line 163
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->k:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    if-eqz v1, :cond_3

    .line 184
    .line 185
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    check-cast v1, Lcom/android/quickstep/util/GroupTask;

    .line 190
    .line 191
    invoke-virtual {v1}, Lcom/android/quickstep/util/GroupTask;->getTasks()Ljava/util/List;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    move v4, v2

    .line 200
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    if-eqz v5, :cond_1

    .line 205
    .line 206
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    check-cast v5, Lcom/android/systemui/shared/recents/model/Task;

    .line 211
    .line 212
    invoke-virtual {v5}, Lcom/android/systemui/shared/recents/model/Task;->getTopComponent()Landroid/content/ComponentName;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    new-instance v7, Ljava/lang/StringBuilder;

    .line 217
    .line 218
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    const-string v8, "\t\tt"

    .line 225
    .line 226
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 227
    .line 228
    .line 229
    add-int/2addr v4, v3

    .line 230
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v8, ": (id="

    .line 234
    .line 235
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget-object v5, v5, Lcom/android/systemui/shared/recents/model/Task;->key:Lcom/android/systemui/shared/recents/model/Task$TaskKey;

    .line 239
    .line 240
    iget v5, v5, Lcom/android/systemui/shared/recents/model/Task$TaskKey;->id:I

    .line 241
    .line 242
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v5, "; package="

    .line 246
    .line 247
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    if-eqz v6, :cond_2

    .line 251
    .line 252
    new-instance v5, Ljava/lang/StringBuilder;

    .line 253
    .line 254
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 255
    .line 256
    .line 257
    invoke-virtual {v6}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 258
    .line 259
    .line 260
    move-result-object v6

    .line 261
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    const-string v6, ")"

    .line 265
    .line 266
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    goto :goto_2

    .line 274
    :cond_2
    const-string v5, "no package)"

    .line 275
    .line 276
    :goto_2
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v5

    .line 283
    invoke-virtual {p2, v5}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    goto :goto_1

    .line 287
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    .line 288
    .line 289
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 290
    .line 291
    .line 292
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    const-string v1, "\t]"

    .line 296
    .line 297
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 305
    .line 306
    .line 307
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 308
    .line 309
    if-eqz p0, :cond_4

    .line 310
    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 317
    .line 318
    .line 319
    const/16 p1, 0x9

    .line 320
    .line 321
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/taskbar/L;->l(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 329
    .line 330
    .line 331
    :cond_4
    return-void
.end method

.method public onControllerInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 7
    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/s;->p:La2/a;

    .line 18
    .line 19
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-nez v2, :cond_1

    .line 28
    .line 29
    iget-object v2, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 30
    .line 31
    invoke-virtual {v2, v0, p1}, Lcom/android/launcher3/taskbar/L;->o(La2/h;Landroid/view/MotionEvent;)Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-nez p1, :cond_1

    .line 36
    .line 37
    const/4 p1, 0x1

    .line 38
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/s;->u(Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    return v1
.end method

.method public onControllerTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method t()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/taskbar/s;->u(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method u(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/s;->o:Lcom/android/launcher3/taskbar/L;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/L;->k(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v(Lcom/android/launcher3/taskbar/R1;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s;->n:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    sget-object v0, Lcom/android/quickstep/RecentsModel;->INSTANCE:Lcom/android/launcher3/util/I;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/android/launcher3/taskbar/R1;->a:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Lcom/android/quickstep/RecentsModel;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/taskbar/s;->i:Lcom/android/quickstep/RecentsModel;

    .line 14
    .line 15
    return-void
.end method
