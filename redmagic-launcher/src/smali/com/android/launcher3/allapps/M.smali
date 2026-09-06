.class public Lcom/android/launcher3/allapps/M;
.super Ljava/lang/Object;
.source "AlphabeticalAppsList.java"

# interfaces
.implements Lcom/android/launcher3/allapps/D$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/M$a;,
        Lcom/android/launcher3/allapps/M$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/allapps/D$a;"
    }
.end annotation


# instance fields
.field private final g:Lcom/android/launcher3/allapps/y0;

.field private final h:Lcom/android/launcher3/allapps/i0;

.field private final i:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field

.field private final l:Lcom/android/launcher3/allapps/D;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/D<",
            "TT;>;"
        }
    .end annotation
.end field

.field private m:I

.field private final n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/M$a;",
            ">;"
        }
    .end annotation
.end field

.field private final p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation
.end field

.field private final q:Landroid/text/SpannableString;

.field private final r:Landroid/text/SpannableString;

.field private s:Lcom/android/launcher3/allapps/O;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/O<",
            "TT;>;"
        }
    .end annotation
.end field

.field private t:Lcom/android/launcher3/allapps/N;

.field private u:I

.field private v:I

.field private w:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private x:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/allapps/D;Lcom/android/launcher3/allapps/y0;Lcom/android/launcher3/allapps/i0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/allapps/D<",
            "TT;>;",
            "Lcom/android/launcher3/allapps/y0;",
            "Lcom/android/launcher3/allapps/i0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/android/launcher3/allapps/M;->m:I

    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 27
    .line 28
    new-instance v1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 34
    .line 35
    new-instance v1, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v1, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 41
    .line 42
    iput-object p2, p0, Lcom/android/launcher3/allapps/M;->l:Lcom/android/launcher3/allapps/D;

    .line 43
    .line 44
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-object v1, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 49
    .line 50
    new-instance v2, Lcom/android/launcher3/allapps/N;

    .line 51
    .line 52
    invoke-direct {v2, p1}, Lcom/android/launcher3/allapps/N;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iput-object v2, p0, Lcom/android/launcher3/allapps/M;->t:Lcom/android/launcher3/allapps/N;

    .line 56
    .line 57
    iput-object p3, p0, Lcom/android/launcher3/allapps/M;->g:Lcom/android/launcher3/allapps/y0;

    .line 58
    .line 59
    iput-object p4, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 60
    .line 61
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 62
    .line 63
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 64
    .line 65
    .line 66
    move-result-object p3

    .line 67
    iget-object p3, p3, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 68
    .line 69
    iget p3, p3, Lcom/android/launcher3/F1;->H0:I

    .line 70
    .line 71
    iput p3, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 72
    .line 73
    if-eqz p2, :cond_0

    .line 74
    .line 75
    invoke-virtual {p2, p0}, Lcom/android/launcher3/allapps/D;->h(Lcom/android/launcher3/allapps/D$a;)V

    .line 76
    .line 77
    .line 78
    :cond_0
    new-instance p2, Landroid/text/SpannableString;

    .line 79
    .line 80
    const-string p3, " "

    .line 81
    .line 82
    invoke-direct {p2, p3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    iput-object p2, p0, Lcom/android/launcher3/allapps/M;->q:Landroid/text/SpannableString;

    .line 86
    .line 87
    new-instance p4, Landroid/text/style/ImageSpan;

    .line 88
    .line 89
    invoke-static {}, Lcom/android/launcher3/y0;->m0()Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_1

    .line 94
    .line 95
    const v1, 0x7f080d5e

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    const v1, 0x7f080d5c

    .line 100
    .line 101
    .line 102
    :goto_0
    const/4 v2, 0x2

    .line 103
    invoke-direct {p4, p1, v1, v2}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;II)V

    .line 104
    .line 105
    .line 106
    const/4 v1, 0x1

    .line 107
    const/16 v3, 0x21

    .line 108
    .line 109
    invoke-virtual {p2, p4, v0, v1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 110
    .line 111
    .line 112
    new-instance p2, Landroid/text/SpannableString;

    .line 113
    .line 114
    invoke-direct {p2, p3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 115
    .line 116
    .line 117
    iput-object p2, p0, Lcom/android/launcher3/allapps/M;->r:Landroid/text/SpannableString;

    .line 118
    .line 119
    new-instance p3, Landroid/text/style/ImageSpan;

    .line 120
    .line 121
    const p4, 0x7f080d5d

    .line 122
    .line 123
    .line 124
    invoke-direct {p3, p1, p4, v2}, Landroid/text/style/ImageSpan;-><init>(Landroid/content/Context;II)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p2, p3, v0, v1, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 128
    .line 129
    .line 130
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iget-object p1, p1, Lcom/android/launcher3/r4;->W:Ljava/util/Set;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/android/launcher3/allapps/M;->x:Ljava/util/Set;

    .line 137
    .line 138
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/d;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b()Ljava/util/TreeMap;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/TreeMap;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/T0;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/util/T0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method private d(Ljava/util/List;I)I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;I)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 11
    .line 12
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->allMatch(Ljava/util/function/Predicate;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v0, v1

    .line 22
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v3, "Adding apps with sections. HasPrivateApps: "

    .line 28
    .line 29
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "AlphabeticalAppsList"

    .line 40
    .line 41
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 45
    .line 46
    instance-of v3, v2, Lcom/android/launcher3/C2;

    .line 47
    .line 48
    if-eqz v3, :cond_1

    .line 49
    .line 50
    check-cast v2, Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    invoke-static {v2}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->e0()LR0/k;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    if-eqz v2, :cond_1

    .line 65
    .line 66
    invoke-virtual {v2}, LR0/k;->p()Z

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eqz v2, :cond_1

    .line 71
    .line 72
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 73
    .line 74
    new-instance v3, Lcom/android/launcher3/allapps/O$a;

    .line 75
    .line 76
    const/16 v4, 0x1000

    .line 77
    .line 78
    invoke-direct {v3, v4}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    add-int/lit8 p2, p2, 0x1

    .line 85
    .line 86
    :cond_1
    const/4 v2, 0x0

    .line 87
    move v3, v1

    .line 88
    :goto_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-ge v3, v4, :cond_6

    .line 93
    .line 94
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v4

    .line 98
    check-cast v4, Lcom/android/launcher3/model/data/d;

    .line 99
    .line 100
    const/4 v5, 0x1

    .line 101
    if-eqz v0, :cond_2

    .line 102
    .line 103
    iget-object v6, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 104
    .line 105
    new-instance v7, Lcom/android/launcher3/allapps/r0;

    .line 106
    .line 107
    iget-object v8, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    invoke-virtual {p0, v3, v9}, Lcom/android/launcher3/allapps/M;->m(II)I

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    invoke-direct {v7, v8, v9, v5}, Lcom/android/launcher3/allapps/r0;-><init>(Landroid/content/Context;IZ)V

    .line 118
    .line 119
    .line 120
    invoke-static {v4, v7}, Lcom/android/launcher3/allapps/O$a;->b(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/allapps/r0;)Lcom/android/launcher3/allapps/O$a;

    .line 121
    .line 122
    .line 123
    move-result-object v7

    .line 124
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_2
    iget-object v6, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 129
    .line 130
    invoke-static {v4}, Lcom/android/launcher3/allapps/O$a;->a(Lcom/android/launcher3/model/data/d;)Lcom/android/launcher3/allapps/O$a;

    .line 131
    .line 132
    .line 133
    move-result-object v7

    .line 134
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    :goto_2
    iget-object v4, v4, Lcom/android/launcher3/model/data/d;->m:Ljava/lang/String;

    .line 138
    .line 139
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v6

    .line 143
    if-nez v6, :cond_5

    .line 144
    .line 145
    invoke-static {}, Lcom/android/launcher3/y0;->m0()Z

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    if-nez v2, :cond_3

    .line 150
    .line 151
    if-eqz v0, :cond_3

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_3
    move v5, v1

    .line 155
    :goto_3
    new-instance v2, Lcom/android/launcher3/allapps/M$a;

    .line 156
    .line 157
    if-eqz v5, :cond_4

    .line 158
    .line 159
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->q:Landroid/text/SpannableString;

    .line 160
    .line 161
    goto :goto_4

    .line 162
    :cond_4
    move-object v5, v4

    .line 163
    :goto_4
    invoke-direct {v2, v5, p2}, Lcom/android/launcher3/allapps/M$a;-><init>(Ljava/lang/CharSequence;I)V

    .line 164
    .line 165
    .line 166
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 167
    .line 168
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-object v2, v4

    .line 172
    :cond_5
    add-int/lit8 p2, p2, 0x1

    .line 173
    .line 174
    add-int/lit8 v3, v3, 0x1

    .line 175
    .line 176
    goto :goto_1

    .line 177
    :cond_6
    return p2
.end method

.method private e(I)I
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->w0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Landroid/multiuser/Flags;->enableMovingContentIntoPrivateSpace()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/i0;->O(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 p1, p1, 0x1

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/android/launcher3/allapps/i0;->E0(Landroid/content/Context;)Ljava/util/function/Predicate;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-static {v1}, Ljava/util/stream/Collectors;->partitioningBy(Ljava/util/function/Predicate;)Ljava/util/stream/Collector;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/util/Map;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 47
    .line 48
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 49
    .line 50
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Ljava/util/List;

    .line 65
    .line 66
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->withCardinality(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget-object v3, Lcom/android/launcher3/logging/StatsLogManager$e;->s3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 75
    .line 76
    invoke-interface {v1, v3}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 80
    .line 81
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 82
    .line 83
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 92
    .line 93
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    check-cast v4, Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    invoke-interface {v1, v4}, Lcom/android/launcher3/logging/StatsLogManager$i;->withCardinality(I)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    sget-object v4, Lcom/android/launcher3/logging/StatsLogManager$e;->t3:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 108
    .line 109
    invoke-interface {v1, v4}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 110
    .line 111
    .line 112
    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    check-cast v1, Ljava/util/List;

    .line 117
    .line 118
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/allapps/M;->d(Ljava/util/List;I)I

    .line 119
    .line 120
    .line 121
    move-result p1

    .line 122
    invoke-static {}, Lcom/android/launcher3/y0;->z0()Z

    .line 123
    .line 124
    .line 125
    move-result v1

    .line 126
    if-eqz v1, :cond_1

    .line 127
    .line 128
    iget-object p1, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Lcom/android/launcher3/allapps/i0;->P(Ljava/util/List;)I

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    invoke-static {}, Lcom/android/launcher3/y0;->m0()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-eqz v1, :cond_1

    .line 141
    .line 142
    new-instance v1, Lcom/android/launcher3/allapps/M$a;

    .line 143
    .line 144
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->r:Landroid/text/SpannableString;

    .line 145
    .line 146
    invoke-direct {v1, v2, p1}, Lcom/android/launcher3/allapps/M$a;-><init>(Ljava/lang/CharSequence;I)V

    .line 147
    .line 148
    .line 149
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    :cond_1
    invoke-interface {v0, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Ljava/util/List;

    .line 159
    .line 160
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/allapps/M;->d(Ljava/util/List;I)I

    .line 161
    .line 162
    .line 163
    move-result p1

    .line 164
    invoke-static {}, Landroid/multiuser/Flags;->enableMovingContentIntoPrivateSpace()Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-eqz v0, :cond_5

    .line 169
    .line 170
    const/4 v0, -0x1

    .line 171
    const/4 v1, 0x0

    .line 172
    move v2, v0

    .line 173
    move v3, v2

    .line 174
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-ge v1, v4, :cond_4

    .line 181
    .line 182
    iget-object v4, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 183
    .line 184
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    check-cast v4, Lcom/android/launcher3/allapps/O$a;

    .line 189
    .line 190
    iget v5, v4, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 191
    .line 192
    const/16 v6, 0x40

    .line 193
    .line 194
    if-ne v5, v6, :cond_2

    .line 195
    .line 196
    move v2, v1

    .line 197
    :cond_2
    iget-object v5, v4, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 198
    .line 199
    if-eqz v5, :cond_3

    .line 200
    .line 201
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    const-string v6, "com.android.privatespace"

    .line 206
    .line 207
    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v5

    .line 211
    if-eqz v5, :cond_3

    .line 212
    .line 213
    iget-object v3, v4, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 214
    .line 215
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 216
    .line 217
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/i0;->y0()Ls1/d;

    .line 218
    .line 219
    .line 220
    move-result-object v5

    .line 221
    iput-object v5, v3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 222
    .line 223
    iget-object v3, v4, Lcom/android/launcher3/allapps/O$a;->d:Lcom/android/launcher3/model/data/d;

    .line 224
    .line 225
    iget-object v4, v3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 226
    .line 227
    iget v5, v4, Ls1/d;->e:I

    .line 228
    .line 229
    or-int/lit8 v5, v5, 0x2

    .line 230
    .line 231
    iput v5, v4, Ls1/d;->e:I

    .line 232
    .line 233
    iget-object v4, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 234
    .line 235
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/i0;->e0()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object v4

    .line 239
    iput-object v4, v3, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 240
    .line 241
    move v3, v1

    .line 242
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_4
    if-eq v2, v0, :cond_5

    .line 246
    .line 247
    if-eq v3, v0, :cond_5

    .line 248
    .line 249
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 250
    .line 251
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    check-cast v0, Lcom/android/launcher3/allapps/O$a;

    .line 256
    .line 257
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 258
    .line 259
    add-int/lit8 v2, v2, 0x1

    .line 260
    .line 261
    invoke-virtual {p0, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    :cond_5
    return p1
.end method

.method private o(Lcom/android/launcher3/model/data/d;)Z
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->x:Ljava/util/Set;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-gtz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->x:Ljava/util/Set;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToShortString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    return p0

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method


# virtual methods
.method public c()V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->l:Lcom/android/launcher3/allapps/D;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->b0()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto/16 :goto_3

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->l:Lcom/android/launcher3/allapps/D;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-static {v0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->l:Lcom/android/launcher3/allapps/D;

    .line 38
    .line 39
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-static {v1}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->X0()Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_9

    .line 56
    .line 57
    new-instance v0, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->l:Lcom/android/launcher3/allapps/D;

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    array-length v3, v2

    .line 69
    const/4 v4, 0x0

    .line 70
    move v5, v4

    .line 71
    :goto_0
    if-ge v5, v3, :cond_5

    .line 72
    .line 73
    aget-object v6, v2, v5

    .line 74
    .line 75
    iget-object v7, p0, Lcom/android/launcher3/allapps/M;->w:Ljava/util/function/Predicate;

    .line 76
    .line 77
    if-eqz v7, :cond_1

    .line 78
    .line 79
    invoke-interface {v7, v6}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v7

    .line 83
    if-nez v7, :cond_1

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->n()Z

    .line 86
    .line 87
    .line 88
    move-result v7

    .line 89
    if-eqz v7, :cond_4

    .line 90
    .line 91
    :cond_1
    invoke-direct {p0, v6}, Lcom/android/launcher3/allapps/M;->o(Lcom/android/launcher3/model/data/d;)Z

    .line 92
    .line 93
    .line 94
    move-result v7

    .line 95
    if-eqz v7, :cond_2

    .line 96
    .line 97
    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_2
    invoke-static {}, Lx1/Y;->i()Ljava/lang/Boolean;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    invoke-virtual {v7}, Ljava/lang/Boolean;->booleanValue()Z

    .line 106
    .line 107
    .line 108
    move-result v7

    .line 109
    if-eqz v7, :cond_3

    .line 110
    .line 111
    iget-object v7, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 112
    .line 113
    invoke-virtual {v7}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    invoke-static {v7}, Lx1/Y;->j(Landroid/content/Context;)Z

    .line 118
    .line 119
    .line 120
    move-result v7

    .line 121
    if-eqz v7, :cond_3

    .line 122
    .line 123
    invoke-static {v6}, Lcom/android/launcher3/resource/h1;->h0(Lcom/android/launcher3/model/data/y;)Z

    .line 124
    .line 125
    .line 126
    move-result v7

    .line 127
    if-eqz v7, :cond_3

    .line 128
    .line 129
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    invoke-virtual {v7}, Lcom/android/launcher3/resource/B;->p()Z

    .line 134
    .line 135
    .line 136
    move-result v7

    .line 137
    if-eqz v7, :cond_4

    .line 138
    .line 139
    :cond_3
    iget-object v7, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 140
    .line 141
    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    :cond_4
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 145
    .line 146
    goto :goto_0

    .line 147
    :cond_5
    :try_start_0
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 148
    .line 149
    iget-object v3, p0, Lcom/android/launcher3/allapps/M;->t:Lcom/android/launcher3/allapps/N;

    .line 150
    .line 151
    invoke-static {v2, v3}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 152
    .line 153
    .line 154
    goto :goto_2

    .line 155
    :catch_0
    move-exception v2

    .line 156
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 157
    .line 158
    .line 159
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-lez v2, :cond_6

    .line 164
    .line 165
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {v2, v4, v0}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 168
    .line 169
    .line 170
    :cond_6
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 171
    .line 172
    instance-of v2, v0, Lcom/android/launcher3/C2;

    .line 173
    .line 174
    if-eqz v2, :cond_7

    .line 175
    .line 176
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 177
    .line 178
    invoke-static {v0}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->e0()LR0/k;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    if-eqz v0, :cond_7

    .line 191
    .line 192
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 193
    .line 194
    check-cast v2, Ljava/util/ArrayList;

    .line 195
    .line 196
    invoke-virtual {v0, v2}, LR0/k;->q(Ljava/util/ArrayList;)V

    .line 197
    .line 198
    .line 199
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->n()Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_8

    .line 204
    .line 205
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 206
    .line 207
    if-eqz v0, :cond_8

    .line 208
    .line 209
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-interface {v1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->t:Lcom/android/launcher3/allapps/N;

    .line 218
    .line 219
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 224
    .line 225
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    new-instance v2, Lcom/android/launcher3/allapps/H;

    .line 229
    .line 230
    invoke-direct {v2, v1}, Lcom/android/launcher3/allapps/H;-><init>(Ljava/util/List;)V

    .line 231
    .line 232
    .line 233
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->forEachOrdered(Ljava/util/function/Consumer;)V

    .line 234
    .line 235
    .line 236
    :cond_8
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->s()V

    .line 237
    .line 238
    .line 239
    return-void

    .line 240
    :cond_9
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->n()Z

    .line 241
    .line 242
    .line 243
    move-result v2

    .line 244
    if-nez v2, :cond_a

    .line 245
    .line 246
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->w:Ljava/util/function/Predicate;

    .line 247
    .line 248
    if-eqz v2, :cond_a

    .line 249
    .line 250
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 255
    .line 256
    if-eqz v2, :cond_a

    .line 257
    .line 258
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/v0;->e()Ljava/util/function/Predicate;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    :cond_a
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->t:Lcom/android/launcher3/allapps/N;

    .line 267
    .line 268
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->t:Lcom/android/launcher3/allapps/N;

    .line 273
    .line 274
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->sorted(Ljava/util/Comparator;)Ljava/util/stream/Stream;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 279
    .line 280
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    iget-object v2, v2, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 289
    .line 290
    sget-object v3, Ljava/util/Locale;->SIMPLIFIED_CHINESE:Ljava/util/Locale;

    .line 291
    .line 292
    invoke-virtual {v2, v3}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v2

    .line 296
    if-eqz v2, :cond_b

    .line 297
    .line 298
    new-instance v2, Lcom/android/launcher3/allapps/I;

    .line 299
    .line 300
    invoke-direct {v2}, Lcom/android/launcher3/allapps/I;-><init>()V

    .line 301
    .line 302
    .line 303
    new-instance v3, Lcom/android/launcher3/allapps/J;

    .line 304
    .line 305
    invoke-direct {v3}, Lcom/android/launcher3/allapps/J;-><init>()V

    .line 306
    .line 307
    .line 308
    new-instance v4, Lcom/android/launcher3/q2;

    .line 309
    .line 310
    invoke-direct {v4}, Lcom/android/launcher3/q2;-><init>()V

    .line 311
    .line 312
    .line 313
    invoke-static {v4}, Ljava/util/stream/Collectors;->toCollection(Ljava/util/function/Supplier;)Ljava/util/stream/Collector;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    invoke-static {v2, v3, v4}, Ljava/util/stream/Collectors;->groupingBy(Ljava/util/function/Function;Ljava/util/function/Supplier;Ljava/util/stream/Collector;)Ljava/util/stream/Collector;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    check-cast v0, Ljava/util/TreeMap;

    .line 326
    .line 327
    invoke-virtual {v0}, Ljava/util/TreeMap;->values()Ljava/util/Collection;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-interface {v0}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    new-instance v2, Lcom/android/launcher3/allapps/K;

    .line 336
    .line 337
    invoke-direct {v2}, Lcom/android/launcher3/allapps/K;-><init>()V

    .line 338
    .line 339
    .line 340
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->flatMap(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    :cond_b
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 345
    .line 346
    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    new-instance v3, Lcom/android/launcher3/allapps/H;

    .line 350
    .line 351
    invoke-direct {v3, v2}, Lcom/android/launcher3/allapps/H;-><init>(Ljava/util/List;)V

    .line 352
    .line 353
    .line 354
    invoke-interface {v0, v3}, Ljava/util/stream/Stream;->forEachOrdered(Ljava/util/function/Consumer;)V

    .line 355
    .line 356
    .line 357
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 358
    .line 359
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    new-instance v2, Lcom/android/launcher3/allapps/H;

    .line 363
    .line 364
    invoke-direct {v2, v0}, Lcom/android/launcher3/allapps/H;-><init>(Ljava/util/List;)V

    .line 365
    .line 366
    .line 367
    invoke-interface {v1, v2}, Ljava/util/stream/Stream;->forEachOrdered(Ljava/util/function/Consumer;)V

    .line 368
    .line 369
    .line 370
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 371
    .line 372
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    if-eqz v0, :cond_c

    .line 377
    .line 378
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->s()V

    .line 379
    .line 380
    .line 381
    :cond_c
    :goto_3
    return-void
.end method

.method f(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/i0;->i0()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->k:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object p1, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Lcom/android/launcher3/allapps/i0;->N(Ljava/util/ArrayList;)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const-string v0, "AlphabeticalAppsList"

    .line 28
    .line 29
    const-string v1, "Adding FastScrollSection for Private Space header. "

    .line 30
    .line 31
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 35
    .line 36
    new-instance v1, Lcom/android/launcher3/allapps/M$a;

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->q:Landroid/text/SpannableString;

    .line 39
    .line 40
    invoke-direct {v1, v2, p1}, Lcom/android/launcher3/allapps/M$a;-><init>(Ljava/lang/CharSequence;I)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    const/4 v1, 0x1

    .line 53
    if-eq v0, v1, :cond_0

    .line 54
    .line 55
    return p1

    .line 56
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/M;->e(I)I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    return p0

    .line 61
    :cond_1
    return p1
.end method

.method public g(Ljava/lang/String;Ljava/io/PrintWriter;)V
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
    const-string p1, "SectionInfo[] size: "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ge p1, v0, :cond_0

    .line 38
    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 42
    .line 43
    .line 44
    const-string v1, "\tFastScrollSection: "

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, Lcom/android/launcher3/allapps/M$a;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    add-int/lit8 p1, p1, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    return-void
.end method

.method public h()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/M$a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/M;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public k()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/M;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public l()Lcom/android/launcher3/allapps/i0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->h:Lcom/android/launcher3/allapps/i0;

    .line 2
    .line 3
    return-object p0
.end method

.method m(II)I
    .locals 4

    .line 1
    int-to-double v0, p2

    .line 2
    iget v2, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 3
    .line 4
    int-to-double v2, v2

    .line 5
    div-double/2addr v0, v2

    .line 6
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    double-to-int v0, v0

    .line 11
    iget p0, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 12
    .line 13
    div-int v1, p1, p0

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    if-ne v1, v0, :cond_2

    .line 19
    .line 20
    rem-int v0, p1, p0

    .line 21
    .line 22
    const/16 v1, 0x10

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    const/16 v2, 0x8

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    rem-int v0, p1, p0

    .line 30
    .line 31
    add-int/lit8 p0, p0, -0x1

    .line 32
    .line 33
    if-ne v0, p0, :cond_1

    .line 34
    .line 35
    move v2, v1

    .line 36
    :cond_1
    :goto_0
    add-int/lit8 p2, p2, -0x1

    .line 37
    .line 38
    if-ne p1, p2, :cond_2

    .line 39
    .line 40
    or-int/lit8 p0, v2, 0x10

    .line 41
    .line 42
    return p0

    .line 43
    :cond_2
    return v2
.end method

.method public n()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public p(Lcom/android/launcher3/allapps/O;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/O<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/M;->s:Lcom/android/launcher3/allapps/O;

    .line 2
    .line 3
    return-void
.end method

.method public q(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 2
    .line 3
    return-void
.end method

.method public r(Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->s()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0
.end method

.method public s()V
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 11
    .line 12
    .line 13
    const-string v1, "Clearing FastScrollerSections."

    .line 14
    .line 15
    const-string v2, "AlphabeticalAppsList"

    .line 16
    .line 17
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    iput v1, p0, Lcom/android/launcher3/allapps/M;->m:I

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->n()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/4 v4, 0x1

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 36
    .line 37
    iget-object v3, p0, Lcom/android/launcher3/allapps/M;->p:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    goto/16 :goto_2

    .line 43
    .line 44
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 45
    .line 46
    instance-of v5, v3, Lcom/android/launcher3/C2;

    .line 47
    .line 48
    if-eqz v5, :cond_1

    .line 49
    .line 50
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 51
    .line 52
    invoke-static {v3}, Lcom/android/launcher3/C2;->e1(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/C2;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->e0()LR0/k;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 67
    .line 68
    iget-object v6, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-virtual {v3, v5, v6}, LR0/k;->k(Landroid/content/Context;Ljava/util/ArrayList;)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    goto :goto_0

    .line 75
    :cond_1
    move v3, v1

    .line 76
    :goto_0
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->g:Lcom/android/launcher3/allapps/y0;

    .line 77
    .line 78
    if-eqz v5, :cond_2

    .line 79
    .line 80
    iget-object v6, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Lcom/android/launcher3/allapps/y0;->s(Ljava/util/ArrayList;)I

    .line 83
    .line 84
    .line 85
    move-result v5

    .line 86
    add-int/2addr v3, v5

    .line 87
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->g:Lcom/android/launcher3/allapps/y0;

    .line 88
    .line 89
    invoke-virtual {v5}, Lcom/android/launcher3/allapps/y0;->C()Z

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    goto :goto_1

    .line 94
    :cond_2
    move v5, v4

    .line 95
    :goto_1
    if-eqz v5, :cond_4

    .line 96
    .line 97
    if-ne v3, v4, :cond_3

    .line 98
    .line 99
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 100
    .line 101
    new-instance v6, Lcom/android/launcher3/allapps/M$a;

    .line 102
    .line 103
    iget-object v7, p0, Lcom/android/launcher3/allapps/M;->i:Landroid/content/Context;

    .line 104
    .line 105
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 106
    .line 107
    .line 108
    move-result-object v7

    .line 109
    const v8, 0x7f1404a2

    .line 110
    .line 111
    .line 112
    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v7

    .line 116
    invoke-direct {v6, v7, v1}, Lcom/android/launcher3/allapps/M$a;-><init>(Ljava/lang/CharSequence;I)V

    .line 117
    .line 118
    .line 119
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    const-string v5, "Adding FastScrollSection for work edu card."

    .line 123
    .line 124
    invoke-static {v2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    .line 126
    .line 127
    :cond_3
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 128
    .line 129
    invoke-direct {p0, v5, v3}, Lcom/android/launcher3/allapps/M;->d(Ljava/util/List;I)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    :cond_4
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    if-eqz v5, :cond_5

    .line 138
    .line 139
    invoke-virtual {p0, v3}, Lcom/android/launcher3/allapps/M;->f(I)I

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    :cond_5
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 144
    .line 145
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 146
    .line 147
    .line 148
    move-result v5

    .line 149
    if-nez v5, :cond_6

    .line 150
    .line 151
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 152
    .line 153
    new-instance v6, Lcom/android/launcher3/allapps/O$a;

    .line 154
    .line 155
    const/16 v7, 0x100

    .line 156
    .line 157
    invoke-direct {v6, v7}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    iget-object v5, p0, Lcom/android/launcher3/allapps/M;->o:Ljava/util/List;

    .line 164
    .line 165
    new-instance v6, Lcom/android/launcher3/allapps/M$a;

    .line 166
    .line 167
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 168
    .line 169
    .line 170
    move-result v7

    .line 171
    sub-int/2addr v7, v4

    .line 172
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v7

    .line 176
    check-cast v7, Lcom/android/launcher3/allapps/M$a;

    .line 177
    .line 178
    iget-object v7, v7, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 179
    .line 180
    invoke-direct {v6, v7, v3}, Lcom/android/launcher3/allapps/M$a;-><init>(Ljava/lang/CharSequence;I)V

    .line 181
    .line 182
    .line 183
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    const-string v3, "Adding FastScrollSection duplicate to scroll to the bottom."

    .line 187
    .line 188
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    :cond_6
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->j:Ljava/util/List;

    .line 192
    .line 193
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    if-nez v2, :cond_7

    .line 198
    .line 199
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 200
    .line 201
    new-instance v3, Lcom/android/launcher3/allapps/O$a;

    .line 202
    .line 203
    const/4 v5, 0x4

    .line 204
    invoke-direct {v3, v5}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    :cond_7
    :goto_2
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 211
    .line 212
    invoke-virtual {v2}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    new-instance v3, Lcom/android/launcher3/allapps/L;

    .line 217
    .line 218
    invoke-direct {v3}, Lcom/android/launcher3/allapps/L;-><init>()V

    .line 219
    .line 220
    .line 221
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    invoke-interface {v2}, Ljava/util/stream/Stream;->count()J

    .line 226
    .line 227
    .line 228
    move-result-wide v2

    .line 229
    long-to-int v2, v2

    .line 230
    iput v2, p0, Lcom/android/launcher3/allapps/M;->m:I

    .line 231
    .line 232
    iget v2, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 233
    .line 234
    if-eqz v2, :cond_d

    .line 235
    .line 236
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    const/4 v3, -0x1

    .line 243
    move v5, v1

    .line 244
    move v6, v5

    .line 245
    :cond_8
    :goto_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 246
    .line 247
    .line 248
    move-result v7

    .line 249
    if-eqz v7, :cond_c

    .line 250
    .line 251
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object v7

    .line 255
    check-cast v7, Lcom/android/launcher3/allapps/O$a;

    .line 256
    .line 257
    iput v1, v7, Lcom/android/launcher3/allapps/O$a;->b:I

    .line 258
    .line 259
    iget v8, v7, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 260
    .line 261
    invoke-static {v8}, Lcom/android/launcher3/allapps/O;->j(I)Z

    .line 262
    .line 263
    .line 264
    move-result v8

    .line 265
    if-nez v8, :cond_b

    .line 266
    .line 267
    iget v8, v7, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 268
    .line 269
    invoke-static {v8}, Lcom/android/launcher3/allapps/O;->l(I)Z

    .line 270
    .line 271
    .line 272
    move-result v8

    .line 273
    if-nez v8, :cond_b

    .line 274
    .line 275
    iget v8, v7, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 276
    .line 277
    invoke-static {v8}, Lcom/android/launcher3/allapps/O;->m(I)Z

    .line 278
    .line 279
    .line 280
    move-result v8

    .line 281
    if-eqz v8, :cond_9

    .line 282
    .line 283
    goto :goto_4

    .line 284
    :cond_9
    iget v8, v7, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 285
    .line 286
    invoke-static {v8}, Lcom/android/launcher3/allapps/O;->k(I)Z

    .line 287
    .line 288
    .line 289
    move-result v8

    .line 290
    if-eqz v8, :cond_8

    .line 291
    .line 292
    iget v8, p0, Lcom/android/launcher3/allapps/M;->u:I

    .line 293
    .line 294
    rem-int v8, v5, v8

    .line 295
    .line 296
    if-nez v8, :cond_a

    .line 297
    .line 298
    add-int/lit8 v3, v3, 0x1

    .line 299
    .line 300
    move v6, v1

    .line 301
    :cond_a
    iput v3, v7, Lcom/android/launcher3/allapps/O$a;->b:I

    .line 302
    .line 303
    iput v6, v7, Lcom/android/launcher3/allapps/O$a;->c:I

    .line 304
    .line 305
    add-int/lit8 v5, v5, 0x1

    .line 306
    .line 307
    add-int/2addr v6, v4

    .line 308
    goto :goto_3

    .line 309
    :cond_b
    :goto_4
    move v5, v1

    .line 310
    goto :goto_3

    .line 311
    :cond_c
    add-int/2addr v3, v4

    .line 312
    iput v3, p0, Lcom/android/launcher3/allapps/M;->v:I

    .line 313
    .line 314
    :cond_d
    iget-object v2, p0, Lcom/android/launcher3/allapps/M;->s:Lcom/android/launcher3/allapps/O;

    .line 315
    .line 316
    if-eqz v2, :cond_e

    .line 317
    .line 318
    new-instance v2, Lcom/android/launcher3/allapps/M$b;

    .line 319
    .line 320
    iget-object v3, p0, Lcom/android/launcher3/allapps/M;->n:Ljava/util/ArrayList;

    .line 321
    .line 322
    invoke-direct {v2, v0, v3}, Lcom/android/launcher3/allapps/M$b;-><init>(Ljava/util/List;Ljava/util/List;)V

    .line 323
    .line 324
    .line 325
    invoke-static {v2, v1}, Landroidx/recyclerview/widget/e;->b(Landroidx/recyclerview/widget/e$b;Z)Landroidx/recyclerview/widget/e$e;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    iget-object v1, p0, Lcom/android/launcher3/allapps/M;->s:Lcom/android/launcher3/allapps/O;

    .line 330
    .line 331
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/e$e;->c(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 332
    .line 333
    .line 334
    :cond_e
    iget-object p0, p0, Lcom/android/launcher3/allapps/M;->s:Lcom/android/launcher3/allapps/O;

    .line 335
    .line 336
    if-eqz p0, :cond_f

    .line 337
    .line 338
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 339
    .line 340
    .line 341
    :cond_f
    return-void
.end method

.method public t(Ljava/util/function/Predicate;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/M;->w:Ljava/util/function/Predicate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
