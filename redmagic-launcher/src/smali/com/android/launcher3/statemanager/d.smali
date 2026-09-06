.class public Lcom/android/launcher3/statemanager/d;
.super Ljava/lang/Object;
.source "StateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/statemanager/d$c;,
        Lcom/android/launcher3/statemanager/d$d;,
        Lcom/android/launcher3/statemanager/d$f;,
        Lcom/android/launcher3/statemanager/d$e;,
        Lcom/android/launcher3/statemanager/d$g;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Lcom/android/launcher3/statemanager/a<",
        "TS;>;T::",
        "Lcom/android/launcher3/statemanager/i<",
        "TS;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final a:Lcom/android/launcher3/statemanager/d$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$c<",
            "TS;>;"
        }
    .end annotation
.end field

.field private final b:Landroid/os/Handler;

.field private final c:Lcom/android/launcher3/statemanager/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final d:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/statemanager/d$g<",
            "TS;>;>;"
        }
    .end annotation
.end field

.field private final e:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private final f:Lcom/android/launcher3/statemanager/d$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d$d<",
            "TS;>;"
        }
    .end annotation
.end field

.field private g:[Lcom/android/launcher3/statemanager/d$f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/android/launcher3/statemanager/d$f<",
            "TS;>;"
        }
    .end annotation
.end field

.field private h:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private i:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private j:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private k:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field l:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private m:Lcom/android/launcher3/statemanager/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field protected n:Lcom/android/launcher3/statemanager/d$e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/statemanager/d<",
            "TS;TT;>.e;"
        }
    .end annotation
.end field

.field private o:I

.field private p:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "TS;TS;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/android/launcher3/statemanager/i;Lcom/android/launcher3/statemanager/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TS;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/statemanager/d$c;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1}, Lcom/android/launcher3/statemanager/d$c;-><init>(Lcom/android/launcher3/statemanager/e;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 11
    .line 12
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->m:Lcom/android/launcher3/statemanager/a;

    .line 24
    .line 25
    iput-object v1, p0, Lcom/android/launcher3/statemanager/d;->p:Landroid/util/Pair;

    .line 26
    .line 27
    new-instance v0, Landroid/os/Handler;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->b:Landroid/os/Handler;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 39
    .line 40
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d;->e:Lcom/android/launcher3/statemanager/a;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 43
    .line 44
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 45
    .line 46
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 47
    .line 48
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/i;->createAtomicAnimationFactory()Lcom/android/launcher3/statemanager/d$d;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 53
    .line 54
    return-void
.end method

.method private G(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance p0, Ljava/lang/Exception;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "\\n"

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const-wide/16 v0, 0x2

    .line 21
    .line 22
    invoke-interface {p0, v0, v1}, Ljava/util/stream/Stream;->skip(J)Ljava/util/stream/Stream;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    new-instance v0, Lcom/android/launcher3/statemanager/b;

    .line 27
    .line 28
    invoke-direct {v0, p1}, Lcom/android/launcher3/statemanager/b;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-wide/16 v0, 0x3

    .line 36
    .line 37
    invoke-interface {p0, v0, v1}, Ljava/util/stream/Stream;->limit(J)Ljava/util/stream/Stream;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "\n"

    .line 42
    .line 43
    invoke-static {p1}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-interface {p0, p1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/String;

    .line 52
    .line 53
    return-object p0
.end method

.method private M(Lcom/android/launcher3/statemanager/a;ZJLandroid/animation/Animator$AnimatorListener;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;ZJ",
            "Landroid/animation/Animator$AnimatorListener;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->m:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/y0;->a0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "StateManager.goToState"

    .line 8
    .line 9
    const-string v2, "StateManager"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 14
    .line 15
    invoke-direct {p0, v1}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-static {v0, p1, v1}, Lcom/android/launcher3/util/D2;->c(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 26
    .line 27
    .line 28
    const-string v3, "goToState - fromState: "

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string v3, ", toState: "

    .line 39
    .line 40
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v3, ", partial trace:\n"

    .line 47
    .line 48
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-direct {p0, v1}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    :goto_0
    invoke-static {}, Landroid/animation/ValueAnimator;->areAnimatorsEnabled()Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    and-int/2addr p2, v0

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v1, "goToState: state "

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v1, "=="

    .line 84
    .line 85
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget-object v3, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 89
    .line 90
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, " , "

    .line 100
    .line 101
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-ne v0, p1, :cond_5

    .line 119
    .line 120
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 121
    .line 122
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 123
    .line 124
    if-nez v1, :cond_2

    .line 125
    .line 126
    if-eqz p5, :cond_1

    .line 127
    .line 128
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 129
    .line 130
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 131
    .line 132
    .line 133
    invoke-interface {p5, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 134
    .line 135
    .line 136
    :cond_1
    sget-object p0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 137
    .line 138
    invoke-virtual {p1, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-nez p0, :cond_7

    .line 143
    .line 144
    const-string p0, "goToState: isInState return 1"

    .line 145
    .line 146
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    return-void

    .line 150
    :cond_2
    invoke-virtual {v0}, LQ1/f;->d()Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_3

    .line 155
    .line 156
    if-eqz p2, :cond_3

    .line 157
    .line 158
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 159
    .line 160
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 161
    .line 162
    if-eq v0, p1, :cond_4

    .line 163
    .line 164
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 165
    .line 166
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/a;->shouldPreserveDataStateOnReapply()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_5

    .line 171
    .line 172
    :cond_4
    if-eqz p5, :cond_7

    .line 173
    .line 174
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 175
    .line 176
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 177
    .line 178
    invoke-virtual {p0, p5}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 179
    .line 180
    .line 181
    return-void

    .line 182
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 183
    .line 184
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 187
    .line 188
    .line 189
    if-nez p2, :cond_8

    .line 190
    .line 191
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 192
    .line 193
    invoke-virtual {p2}, Lcom/android/launcher3/statemanager/d$d;->cancelAllStateElementAnimation()V

    .line 194
    .line 195
    .line 196
    const-string p2, "goToState: onStateTransitionStart"

    .line 197
    .line 198
    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->X(Lcom/android/launcher3/statemanager/a;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 205
    .line 206
    .line 207
    move-result-object p2

    .line 208
    array-length p3, p2

    .line 209
    const/4 p4, 0x0

    .line 210
    :goto_1
    if-ge p4, p3, :cond_6

    .line 211
    .line 212
    aget-object v0, p2, p4

    .line 213
    .line 214
    invoke-interface {v0, p1}, Lcom/android/launcher3/statemanager/d$f;->setState(Ljava/lang/Object;)V

    .line 215
    .line 216
    .line 217
    add-int/lit8 p4, p4, 0x1

    .line 218
    .line 219
    goto :goto_1

    .line 220
    :cond_6
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->W(Lcom/android/launcher3/statemanager/a;)V

    .line 221
    .line 222
    .line 223
    if-eqz p5, :cond_7

    .line 224
    .line 225
    new-instance p0, Landroid/animation/AnimatorSet;

    .line 226
    .line 227
    invoke-direct {p0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 228
    .line 229
    .line 230
    invoke-interface {p5, p0}, Landroid/animation/Animator$AnimatorListener;->onAnimationEnd(Landroid/animation/Animator;)V

    .line 231
    .line 232
    .line 233
    :cond_7
    return-void

    .line 234
    :cond_8
    const-wide/16 v0, 0x0

    .line 235
    .line 236
    cmp-long p2, p3, v0

    .line 237
    .line 238
    if-lez p2, :cond_9

    .line 239
    .line 240
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 241
    .line 242
    iget p2, p2, Lcom/android/launcher3/statemanager/d$c;->n:I

    .line 243
    .line 244
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->b:Landroid/os/Handler;

    .line 245
    .line 246
    new-instance v1, Lcom/android/launcher3/statemanager/c;

    .line 247
    .line 248
    invoke-direct {v1, p0, p2, p1, p5}, Lcom/android/launcher3/statemanager/c;-><init>(Lcom/android/launcher3/statemanager/d;ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v0, v1, p3, p4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 252
    .line 253
    .line 254
    return-void

    .line 255
    :cond_9
    const-string p2, "goToState:  goToStateAnimated "

    .line 256
    .line 257
    invoke-static {v2, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 261
    .line 262
    invoke-direct {p0, p1, p2, p5}, Lcom/android/launcher3/statemanager/d;->O(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 263
    .line 264
    .line 265
    return-void
.end method

.method private O(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;TS;",
            "Landroid/animation/Animator$AnimatorListener;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->e:Lcom/android/launcher3/statemanager/a;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {v0, v1, v2}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    :goto_0
    int-to-long v0, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-interface {p1, v0, v1}, Lcom/android/launcher3/statemanager/a;->getTransitionDuration(Lcom/android/launcher3/views/k;Z)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :goto_1
    iput-wide v0, p2, LQ1/f;->g:J

    .line 27
    .line 28
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 29
    .line 30
    iget v0, p2, LQ1/f;->i:I

    .line 31
    .line 32
    iget v1, p0, Lcom/android/launcher3/statemanager/d;->o:I

    .line 33
    .line 34
    or-int/2addr v0, v1

    .line 35
    iput v0, p2, LQ1/f;->i:I

    .line 36
    .line 37
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1, p2}, Lcom/android/launcher3/statemanager/d;->Y(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->q(Lcom/android/launcher3/statemanager/a;)Lcom/android/launcher3/anim/V;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    if-eqz p3, :cond_1

    .line 51
    .line 52
    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    const-string p2, "StateManager"

    .line 56
    .line 57
    const-string p3, "goToStateAnimated: start animation."

    .line 58
    .line 59
    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    new-instance p2, Lcom/android/launcher3/statemanager/d$e;

    .line 63
    .line 64
    invoke-direct {p2, p0, p1}, Lcom/android/launcher3/statemanager/d$e;-><init>(Lcom/android/launcher3/statemanager/d;Landroid/animation/AnimatorSet;)V

    .line 65
    .line 66
    .line 67
    iput-object p2, p0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->b:Landroid/os/Handler;

    .line 70
    .line 71
    invoke-virtual {p0, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method private synthetic R(ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/statemanager/d$c;->n:I

    .line 4
    .line 5
    if-eq v0, p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    sget-object p1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 14
    .line 15
    if-ne p2, p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-void

    .line 19
    :cond_1
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v0, "goToState: delay goToStateAnimated "

    .line 25
    .line 26
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const-string v0, "StateManager"

    .line 37
    .line 38
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 42
    .line 43
    invoke-direct {p0, p2, p1, p3}, Lcom/android/launcher3/statemanager/d;->O(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private W(Lcom/android/launcher3/statemanager/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    if-eq p1, v0, :cond_0

    .line 4
    .line 5
    invoke-interface {p1, v0}, Lcom/android/launcher3/statemanager/a;->getHistoryForState(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/statemanager/a;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetEnd(Lcom/android/launcher3/statemanager/a;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->e:Lcom/android/launcher3/statemanager/a;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->i0(Lcom/android/launcher3/statemanager/a;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->a0()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/util/D2;->d(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v1, "onStateTransitionEnd - state: "

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "StateManager"

    .line 56
    .line 57
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    add-int/lit8 v0, v0, -0x1

    .line 67
    .line 68
    :goto_1
    if-ltz v0, :cond_3

    .line 69
    .line 70
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    check-cast v1, Lcom/android/launcher3/statemanager/d$g;

    .line 77
    .line 78
    invoke-interface {v1, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionComplete(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v0, v0, -0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->k0(Lcom/android/launcher3/statemanager/a;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method private X(Lcom/android/launcher3/statemanager/a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "onStateTransitionStart: current state: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, "--mState:"

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "StateManager"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 36
    .line 37
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->l0(Lcom/android/launcher3/statemanager/a;)V

    .line 38
    .line 39
    .line 40
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 43
    .line 44
    invoke-interface {v0, p1}, Lcom/android/launcher3/statemanager/i;->onStateSetStart(Lcom/android/launcher3/statemanager/a;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/android/launcher3/y0;->a0()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_0

    .line 52
    .line 53
    invoke-static {p1}, Lcom/android/launcher3/util/D2;->e(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string v2, "onStateTransitionStart - state: "

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    .line 76
    .line 77
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/lit8 v0, v0, -0x1

    .line 84
    .line 85
    :goto_1
    if-ltz v0, :cond_1

    .line 86
    .line 87
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    check-cast v1, Lcom/android/launcher3/statemanager/d$g;

    .line 94
    .line 95
    invoke-interface {v1, p1}, Lcom/android/launcher3/statemanager/d$g;->onStateTransitionStart(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    add-int/lit8 v0, v0, -0x1

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_1
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

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

.method public static synthetic b(Lcom/android/launcher3/statemanager/d;ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/statemanager/d;->R(ILcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/statemanager/d;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->p:Landroid/util/Pair;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/d$d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/d$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/statemanager/d;)Lcom/android/launcher3/statemanager/a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/statemanager/d;Landroid/util/Pair;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->p:Landroid/util/Pair;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->W(Lcom/android/launcher3/statemanager/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->X(Lcom/android/launcher3/statemanager/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private k0(Lcom/android/launcher3/statemanager/a;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz v1, :cond_8

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    const-string p0, "StateManager"

    .line 16
    .line 17
    const-string p1, "stateChangeEndMFV--getOverviewPanelMFV() == null"

    .line 18
    .line 19
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->w()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->k3()V

    .line 34
    .line 35
    .line 36
    :cond_1
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 37
    .line 38
    if-ne p1, v1, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v2}, Lcom/android/launcher3/menu/MenuContainer;->I()V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 48
    .line 49
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 50
    .line 51
    if-ne p0, v2, :cond_3

    .line 52
    .line 53
    if-ne p1, v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Lcom/android/launcher3/menu/c;->w()V

    .line 60
    .line 61
    .line 62
    :cond_3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->V2()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    const/4 v3, 0x1

    .line 67
    const/4 v4, 0x0

    .line 68
    if-eq p1, v1, :cond_5

    .line 69
    .line 70
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 71
    .line 72
    if-eq p1, v1, :cond_5

    .line 73
    .line 74
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 75
    .line 76
    if-eq p1, v1, :cond_5

    .line 77
    .line 78
    sget-object v1, Lcom/android/launcher3/V3;->t:Lcom/android/launcher3/V3;

    .line 79
    .line 80
    if-ne p1, v1, :cond_4

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_4
    move v1, v4

    .line 84
    goto :goto_1

    .line 85
    :cond_5
    :goto_0
    move v1, v3

    .line 86
    :goto_1
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v5}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 91
    .line 92
    .line 93
    move-result-object v5

    .line 94
    if-eqz v5, :cond_7

    .line 95
    .line 96
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v5}, Lcom/android/launcher3/H5;->k0()Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-nez v5, :cond_7

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    if-ne p1, v2, :cond_6

    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_6
    move v3, v4

    .line 118
    :goto_2
    invoke-virtual {v0, p0, v1, v3}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;->b(ZZZ)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_7
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->k0()Z

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    if-eqz p0, :cond_8

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {p0, v4}, Lcom/android/launcher3/LongClickTextView;->setVisibility(I)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    const/16 p1, 0x8

    .line 148
    .line 149
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 150
    .line 151
    .line 152
    :cond_8
    return-void
.end method

.method private l0(Lcom/android/launcher3/statemanager/a;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    if-eqz v1, :cond_7

    .line 6
    .line 7
    check-cast v0, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    goto/16 :goto_0

    .line 16
    .line 17
    :cond_0
    const-string v1, "StateManager"

    .line 18
    .line 19
    const-string v2, "stateChangeStartMFV"

    .line 20
    .line 21
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 25
    .line 26
    sget-object v2, Lcom/android/launcher3/V3;->A:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    if-ne v1, v2, :cond_1

    .line 29
    .line 30
    sget-object v1, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 31
    .line 32
    if-ne p1, v1, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/menu/MenuContainer;->n()V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 42
    .line 43
    const/4 v3, 0x1

    .line 44
    const/4 v4, 0x0

    .line 45
    if-eq v1, v2, :cond_2

    .line 46
    .line 47
    sget-object v5, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 48
    .line 49
    if-eq v1, v5, :cond_2

    .line 50
    .line 51
    sget-object v5, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 52
    .line 53
    if-ne v1, v5, :cond_3

    .line 54
    .line 55
    :cond_2
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 56
    .line 57
    if-ne p1, v1, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v1, v3, v4}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 67
    .line 68
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 69
    .line 70
    if-ne p0, v1, :cond_4

    .line 71
    .line 72
    if-ne p1, v2, :cond_4

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v4, v3}, Lcom/android/launcher3/G4;->G(ZZ)V

    .line 79
    .line 80
    .line 81
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->R2()Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    if-eqz p0, :cond_5

    .line 86
    .line 87
    sget-object p0, Lcom/android/launcher3/V3;->v:Lcom/android/launcher3/V3;

    .line 88
    .line 89
    if-ne p1, p0, :cond_5

    .line 90
    .line 91
    invoke-virtual {v0, v4}, Lcom/android/launcher3/C2;->m1(Z)V

    .line 92
    .line 93
    .line 94
    :cond_5
    if-ne p1, v2, :cond_6

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p0, v1}, Lx1/Z;->b(Lcom/android/launcher3/Workspace;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->q2()Lcom/android/launcher3/menu/MenuContainer;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 118
    .line 119
    invoke-virtual {p0, v1}, Lcom/android/launcher3/menu/MenuContainer;->H(Lcom/android/launcher3/q4$a;)V

    .line 120
    .line 121
    .line 122
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    const-string p1, ""

    .line 131
    .line 132
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-virtual {v0, p0}, Lcom/android/launcher3/C2;->b4(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    :cond_7
    :goto_0
    return-void
.end method

.method private m()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->removeListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 12
    .line 13
    iput-object v2, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 16
    .line 17
    iput-object v2, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 18
    .line 19
    return-void
.end method

.method private q(Lcom/android/launcher3/statemanager/a;)Lcom/android/launcher3/anim/V;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)",
            "Lcom/android/launcher3/anim/V;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 4
    .line 5
    iget-wide v1, v1, LQ1/f;->g:J

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, LQ1/f;->c(I)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    array-length v2, v1

    .line 24
    const/4 v3, 0x0

    .line 25
    :goto_0
    if-ge v3, v2, :cond_0

    .line 26
    .line 27
    aget-object v4, v1, v3

    .line 28
    .line 29
    iget-object v5, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 30
    .line 31
    invoke-interface {v4, p1, v5, v0}, Lcom/android/launcher3/statemanager/d$f;->setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 32
    .line 33
    .line 34
    add-int/lit8 v3, v3, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v2, "createAnimationToNewWorkspaceInternal: "

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const-string v2, "StateManager"

    .line 55
    .line 56
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->s(Lcom/android/launcher3/statemanager/a;)Landroid/animation/Animator$AnimatorListener;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/f;->g(Landroid/animation/Animator$AnimatorListener;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/statemanager/d$c;->h(Landroid/animation/AnimatorSet;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    return-object v0
.end method

.method private s(Lcom/android/launcher3/statemanager/a;)Landroid/animation/Animator$AnimatorListener;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)",
            "Landroid/animation/Animator$AnimatorListener;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/statemanager/d$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/statemanager/d$a;-><init>(Lcom/android/launcher3/statemanager/d;Lcom/android/launcher3/statemanager/a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public A()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()Lcom/android/launcher3/statemanager/a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->k:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->e:Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    return-object v0
.end method

.method public C()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public D()[Lcom/android/launcher3/statemanager/d$f;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lcom/android/launcher3/statemanager/d$f<",
            "TS;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->g:[Lcom/android/launcher3/statemanager/d$f;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 11
    .line 12
    invoke-interface {v1, v0}, Lcom/android/launcher3/statemanager/i;->collectStateHandlers(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    new-array v1, v1, [Lcom/android/launcher3/statemanager/d$f;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, [Lcom/android/launcher3/statemanager/d$f;

    .line 26
    .line 27
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->g:[Lcom/android/launcher3/statemanager/d$f;

    .line 28
    .line 29
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->g:[Lcom/android/launcher3/statemanager/d$f;

    .line 30
    .line 31
    return-object p0
.end method

.method public E()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    return-object p0
.end method

.method public F()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->m:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public H(Lcom/android/launcher3/statemanager/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I(Lcom/android/launcher3/statemanager/a;J)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;J)V"
        }
    .end annotation

    .line 1
    const/4 v2, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-wide v3, p2

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/statemanager/d;->M(Lcom/android/launcher3/statemanager/a;ZJLandroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public J(Lcom/android/launcher3/statemanager/a;JLandroid/animation/Animator$AnimatorListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;J",
            "Landroid/animation/Animator$AnimatorListener;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v2, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-wide v3, p2

    .line 5
    move-object v5, p4

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/statemanager/d;->M(Lcom/android/launcher3/statemanager/a;ZJLandroid/animation/Animator$AnimatorListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public K(Lcom/android/launcher3/statemanager/a;Landroid/animation/Animator$AnimatorListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;",
            "Landroid/animation/Animator$AnimatorListener;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public L(Lcom/android/launcher3/statemanager/a;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;Z)V"
        }
    .end annotation

    .line 1
    const-wide/16 v3, 0x0

    .line 2
    .line 3
    const/4 v5, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move-object v1, p1

    .line 6
    move v2, p2

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/statemanager/d;->M(Lcom/android/launcher3/statemanager/a;ZJLandroid/animation/Animator$AnimatorListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;Z",
            "Landroid/animation/Animator$AnimatorListener;",
            ")V"
        }
    .end annotation

    .line 1
    const-wide/16 v3, 0x0

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move v2, p2

    .line 6
    move-object v5, p3

    .line 7
    invoke-direct/range {v0 .. v5}, Lcom/android/launcher3/statemanager/d;->M(Lcom/android/launcher3/statemanager/a;ZJLandroid/animation/Animator$AnimatorListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public P(Lcom/android/launcher3/statemanager/a;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 6
    .line 7
    if-ne v0, p1, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->m:Ljava/lang/Object;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    if-ne p0, p1, :cond_1

    .line 16
    .line 17
    :cond_0
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public Q()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public S()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->j0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->T(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public T(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, LQ1/f;->d()Z

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
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/android/launcher3/statemanager/a;->shouldDisableRestore()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->B()Lcom/android/launcher3/statemanager/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/statemanager/d;->L(Lcom/android/launcher3/statemanager/a;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->e:Lcom/android/launcher3/statemanager/a;

    .line 30
    .line 31
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 32
    .line 33
    :cond_1
    :goto_0
    return-void
.end method

.method public U(Lcom/android/launcher3/statemanager/a;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    invoke-interface {v2, p1}, Lcom/android/launcher3/statemanager/d$f;->onBackCancelled(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method

.method public V(Lcom/android/launcher3/statemanager/a;F)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;F)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length v0, p0

    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    if-ge v1, v0, :cond_0

    .line 8
    .line 9
    aget-object v2, p0, v1

    .line 10
    .line 11
    invoke-interface {v2, p1, p2}, Lcom/android/launcher3/statemanager/d$f;->onBackProgressed(Ljava/lang/Object;F)V

    .line 12
    .line 13
    .line 14
    add-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return-void
.end method

.method public Y(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;TS;",
            "LQ1/f;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/statemanager/d$d;->prepareForAtomicAnimation(Ljava/lang/Object;Ljava/lang/Object;LQ1/f;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/statemanager/d;->a0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public a0(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move v1, v2

    .line 11
    :goto_0
    if-eqz p1, :cond_2

    .line 12
    .line 13
    iget p1, v0, LQ1/f;->h:I

    .line 14
    .line 15
    and-int/lit8 p1, p1, 0x2

    .line 16
    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 20
    .line 21
    invoke-interface {p1}, Lcom/android/launcher3/statemanager/a;->shouldPreserveDataStateOnReapply()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 28
    .line 29
    iget-object p1, p1, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 34
    .line 35
    .line 36
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 37
    .line 38
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d$d;->cancelAllStateElementAnimation()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 45
    .line 46
    iget-object p1, p1, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 47
    .line 48
    if-nez p1, :cond_4

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    array-length v0, p1

    .line 55
    :goto_1
    if-ge v2, v0, :cond_3

    .line 56
    .line 57
    aget-object v3, p1, v2

    .line 58
    .line 59
    iget-object v4, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 60
    .line 61
    invoke-interface {v3, v4}, Lcom/android/launcher3/statemanager/d$f;->setState(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    add-int/lit8 v2, v2, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :cond_3
    if-eqz v1, :cond_4

    .line 68
    .line 69
    iget-object p1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 70
    .line 71
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->W(Lcom/android/launcher3/statemanager/a;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    return-void
.end method

.method public b0(Lcom/android/launcher3/statemanager/d$g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/statemanager/d$g<",
            "TS;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c0(Landroid/animation/AnimatorSet;Lcom/android/launcher3/statemanager/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/animation/AnimatorSet;",
            "TS;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    new-array v0, v0, [Landroid/animation/Animator;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v1, "setCurrentAnimation: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "StateManager"

    .line 28
    .line 29
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    invoke-direct {p0, p2}, Lcom/android/launcher3/statemanager/d;->s(Lcom/android/launcher3/statemanager/a;)Landroid/animation/Animator$AnimatorListener;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public varargs d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d$e;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    array-length v0, p2

    .line 15
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, v0, :cond_4

    .line 18
    .line 19
    aget-object v3, p2, v2

    .line 20
    .line 21
    if-nez v3, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    iget-object v4, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 25
    .line 26
    iget-object v4, v4, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 27
    .line 28
    if-eqz v4, :cond_2

    .line 29
    .line 30
    invoke-virtual {v4}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    if-ne v4, v3, :cond_2

    .line 35
    .line 36
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/d;->m()V

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_2
    iget-object v4, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 41
    .line 42
    iget-object v4, v4, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    if-ne v4, v3, :cond_3

    .line 45
    .line 46
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/d;->m()V

    .line 47
    .line 48
    .line 49
    goto :goto_2

    .line 50
    :cond_3
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_4
    :goto_2
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 54
    .line 55
    iget-object p2, p2, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 56
    .line 57
    if-eqz p2, :cond_5

    .line 58
    .line 59
    const/4 v1, 0x1

    .line 60
    :cond_5
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 61
    .line 62
    .line 63
    if-eqz v1, :cond_6

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Z()V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 69
    .line 70
    invoke-direct {p0, p2}, Lcom/android/launcher3/statemanager/d;->W(Lcom/android/launcher3/statemanager/a;)V

    .line 71
    .line 72
    .line 73
    :cond_6
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    if-eqz p2, :cond_7

    .line 77
    .line 78
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 81
    .line 82
    invoke-static {p2}, Lcom/android/launcher3/statemanager/d$e;->a(Lcom/android/launcher3/statemanager/d$e;)Landroid/animation/AnimatorSet;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    if-eq v1, p2, :cond_7

    .line 87
    .line 88
    const-string p2, "StateManager"

    .line 89
    .line 90
    const-string v1, "setCurrentAnimation: remove the runnable added before"

    .line 91
    .line 92
    invoke-static {p2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->b:Landroid/os/Handler;

    .line 96
    .line 97
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    iput-object v0, p0, Lcom/android/launcher3/statemanager/d;->n:Lcom/android/launcher3/statemanager/d$e;

    .line 103
    .line 104
    :cond_7
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 105
    .line 106
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d$c;->h(Landroid/animation/AnimatorSet;Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public e0(Lcom/android/launcher3/anim/q;I)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/statemanager/d;->m()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/android/launcher3/anim/q;->r()Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const/4 v1, 0x0

    .line 9
    new-array v1, v1, [Landroid/animation/Animator;

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/statemanager/d;->d0(Landroid/animation/AnimatorSet;[Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 15
    .line 16
    iput p2, p0, LQ1/f;->h:I

    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 19
    .line 20
    return-void
.end method

.method public f0(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-nez v1, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    goto :goto_1

    .line 14
    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 15
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isAppOpenType()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_2

    .line 23
    .line 24
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 25
    .line 26
    sget-object v2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 27
    .line 28
    if-ne v1, v2, :cond_3

    .line 29
    .line 30
    :cond_2
    if-eqz v0, :cond_3

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Z()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 36
    .line 37
    invoke-direct {p0, v0}, Lcom/android/launcher3/statemanager/d;->W(Lcom/android/launcher3/statemanager/a;)V

    .line 38
    .line 39
    .line 40
    :cond_3
    if-eqz p2, :cond_4

    .line 41
    .line 42
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 43
    .line 44
    const/4 p2, 0x0

    .line 45
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/statemanager/d$c;->i(Lcom/android/quickstep/util/animation/MultiAnimatorSet;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    :cond_4
    return-void
.end method

.method public g0(Lcom/android/launcher3/anim/q;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->e0(Lcom/android/launcher3/anim/q;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public h0(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/statemanager/d;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public i0(Lcom/android/launcher3/statemanager/a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setRestState: "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "StateManager"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/statemanager/d;->k:Lcom/android/launcher3/statemanager/a;

    .line 24
    .line 25
    return-void
.end method

.method public j(Lcom/android/launcher3/statemanager/d$g;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/statemanager/d$g<",
            "TS;>;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->d:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j0()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->c:Lcom/android/launcher3/statemanager/i;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/android/launcher3/statemanager/i;->shouldAnimateStateChange()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "StateManager"

    .line 6
    .line 7
    const-string v2, "StateManager.cancelAnimation"

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x0

    .line 20
    :goto_0
    invoke-direct {p0, v2}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-static {v0, v2}, Lcom/android/launcher3/util/D2;->a(ZLjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v3, "cancelAnimation - with ongoing animation, partial trace:\n"

    .line 40
    .line 41
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-direct {p0, v2}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    :cond_2
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d$c;->g()V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 66
    .line 67
    if-eqz v0, :cond_3

    .line 68
    .line 69
    invoke-virtual {v0}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->isRunning()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_3

    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v2, "cancelAnimation: "

    .line 81
    .line 82
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 88
    .line 89
    invoke-virtual {v2}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->getMAnimationId()I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->o:Lcom/android/quickstep/util/animation/MultiAnimatorSet;

    .line 106
    .line 107
    const/4 v1, 0x7

    .line 108
    invoke-virtual {v0, v1}, Lcom/android/quickstep/util/animation/MultiAnimatorSet;->cancel(I)V

    .line 109
    .line 110
    .line 111
    :cond_3
    :goto_2
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 112
    .line 113
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 114
    .line 115
    if-nez v1, :cond_5

    .line 116
    .line 117
    iget-object v1, v0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 118
    .line 119
    if-eqz v1, :cond_4

    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_4
    return-void

    .line 123
    :cond_5
    :goto_3
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d$c;->g()V

    .line 124
    .line 125
    .line 126
    goto :goto_2
.end method

.method public l(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d$d;->a(Lcom/android/launcher3/statemanager/d$d;)[Landroid/animation/Animator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    aget-object v0, v0, p1

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/statemanager/d$d;->a(Lcom/android/launcher3/statemanager/d$d;)[Landroid/animation/Animator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    aget-object p0, p0, p1

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public n(Lcom/android/launcher3/statemanager/a;J)Lcom/android/launcher3/anim/q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;J)",
            "Lcom/android/launcher3/anim/q;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/launcher3/statemanager/d;->o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public o(Lcom/android/launcher3/statemanager/a;JI)Lcom/android/launcher3/anim/q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;JI)",
            "Lcom/android/launcher3/anim/q;"
        }
    .end annotation

    .line 1
    new-instance v0, LQ1/f;

    .line 2
    .line 3
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p2, v0, LQ1/f;->g:J

    .line 7
    .line 8
    iput p4, v0, LQ1/f;->i:I

    .line 9
    .line 10
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/statemanager/d;->p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public p(Lcom/android/launcher3/statemanager/a;LQ1/f;)Lcom/android/launcher3/anim/q;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;",
            "LQ1/f;",
            ")",
            "Lcom/android/launcher3/anim/q;"
        }
    .end annotation

    .line 1
    iget v0, p2, LQ1/f;->h:I

    .line 2
    .line 3
    or-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iput v0, p2, LQ1/f;->h:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->k()V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 11
    .line 12
    invoke-virtual {p2, v0}, LQ1/f;->a(LQ1/f;)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v0, "createAnimationToNewWorkspace: "

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const-string v0, "StateManager"

    .line 33
    .line 34
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    iget-object p2, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 38
    .line 39
    invoke-direct {p0, p1}, Lcom/android/launcher3/statemanager/d;->q(Lcom/android/launcher3/statemanager/a;)Lcom/android/launcher3/anim/V;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/android/launcher3/anim/V;->s()Lcom/android/launcher3/anim/q;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p2, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->k:Lcom/android/launcher3/anim/q;

    .line 52
    .line 53
    return-object p0
.end method

.method public r(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)Landroid/animation/AnimatorSet;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TS;TS;",
            "LQ1/f;",
            ")",
            "Landroid/animation/AnimatorSet;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->a0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "StateManager.createAtomicAnimation"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 10
    .line 11
    invoke-direct {p0, v1}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v0, p2, v1}, Lcom/android/launcher3/util/D2;->b(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    const-string v2, "createAtomicAnimation - fromState: "

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v2, ", toState: "

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v2, ", partial trace:\n"

    .line 41
    .line 42
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-direct {p0, v1}, Lcom/android/launcher3/statemanager/d;->G(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    const-string v1, "StateManager"

    .line 57
    .line 58
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    :goto_0
    new-instance v0, Lcom/android/launcher3/anim/V;

    .line 62
    .line 63
    iget-wide v1, p3, LQ1/f;->g:J

    .line 64
    .line 65
    invoke-direct {v0, v1, v2}, Lcom/android/launcher3/anim/V;-><init>(J)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/statemanager/d;->Y(Lcom/android/launcher3/statemanager/a;Lcom/android/launcher3/statemanager/a;LQ1/f;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->D()[Lcom/android/launcher3/statemanager/d$f;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    array-length p1, p0

    .line 76
    const/4 v1, 0x0

    .line 77
    :goto_1
    if-ge v1, p1, :cond_1

    .line 78
    .line 79
    aget-object v2, p0, v1

    .line 80
    .line 81
    invoke-interface {v2, p2, p3, v0}, Lcom/android/launcher3/statemanager/d$f;->setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 82
    .line 83
    .line 84
    add-int/lit8 v1, v1, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/anim/V;->k()Landroid/animation/AnimatorSet;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0
.end method

.method public varargs t(I[F)Landroid/animation/Animator;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/statemanager/d;->l(I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 5
    .line 6
    invoke-virtual {v0, p1, p2}, Lcom/android/launcher3/statemanager/d$d;->createStateElementAnimation(I[F)Landroid/animation/Animator;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->f:Lcom/android/launcher3/statemanager/d$d;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/android/launcher3/statemanager/d$d;->a(Lcom/android/launcher3/statemanager/d$d;)[Landroid/animation/Animator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    aput-object p2, v0, p1

    .line 17
    .line 18
    new-instance v0, Lcom/android/launcher3/statemanager/d$b;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/statemanager/d$b;-><init>(Lcom/android/launcher3/statemanager/d;I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 24
    .line 25
    .line 26
    return-object p2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, " StateManager(mLastStableState:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", mCurrentStableState:"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", mState:"

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", mRestState:"

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->k:Lcom/android/launcher3/statemanager/a;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v1, ", isInTransition:"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string p0, ")"

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method

.method public u(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 2

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
    const-string v1, "StateManager:"

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
    const-string v1, "\tmLastStableState:"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->i:Lcom/android/launcher3/statemanager/a;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v1, "\tmCurrentStableState:"

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    const-string v1, "\tmState:"

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->h:Lcom/android/launcher3/statemanager/a;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance v0, Ljava/lang/StringBuilder;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v1, "\tmRestState:"

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v1, p0, Lcom/android/launcher3/statemanager/d;->k:Lcom/android/launcher3/statemanager/a;

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p1, "\tisInTransition:"

    .line 130
    .line 131
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0}, Lcom/android/launcher3/statemanager/d;->Q()Z

    .line 135
    .line 136
    .line 137
    move-result p0

    .line 138
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void
.end method

.method public v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->a:Lcom/android/launcher3/statemanager/d$c;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d$c;->l:Landroid/animation/AnimatorSet;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->end()V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public w()Landroid/util/Pair;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "TS;TS;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->p:Landroid/util/Pair;

    .line 2
    .line 3
    return-object p0
.end method

.method public x()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->j:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/statemanager/d;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public z()Lcom/android/launcher3/statemanager/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/statemanager/d;->l:Lcom/android/launcher3/statemanager/a;

    .line 2
    .line 3
    return-object p0
.end method
