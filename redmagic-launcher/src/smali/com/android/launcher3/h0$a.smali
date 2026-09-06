.class public Lcom/android/launcher3/h0$a;
.super Ljava/lang/Object;
.source "DeviceProfile.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/h0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lcom/android/launcher3/F1;

.field private final c:Lcom/android/launcher3/util/Z$c;

.field private final d:Lcom/android/launcher3/util/window/d;

.field private final e:Ln1/C;

.field private f:Lcom/android/launcher3/util/p3;

.field private g:Z

.field private h:Z

.field private i:Ljava/lang/Boolean;

.field private j:Ljava/lang/Boolean;

.field private k:Lcom/android/launcher3/h0$b;

.field private l:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ls1/m;",
            ">;"
        }
    .end annotation
.end field

.field private m:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/h0;",
            ">;"
        }
    .end annotation
.end field

.field private n:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/window/d;Ln1/C;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/h0$a;->h:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/android/launcher3/h0$a;->k:Lcom/android/launcher3/h0$b;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->a:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/android/launcher3/h0$a;->b:Lcom/android/launcher3/F1;

    .line 13
    .line 14
    iput-object p3, p0, Lcom/android/launcher3/h0$a;->c:Lcom/android/launcher3/util/Z$c;

    .line 15
    .line 16
    iput-object p4, p0, Lcom/android/launcher3/h0$a;->d:Lcom/android/launcher3/util/window/d;

    .line 17
    .line 18
    iput-object p5, p0, Lcom/android/launcher3/h0$a;->e:Ln1/C;

    .line 19
    .line 20
    invoke-virtual {p3}, Lcom/android/launcher3/util/Z$c;->r()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    iput-boolean p1, p0, Lcom/android/launcher3/h0$a;->n:Z

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public a()Lcom/android/launcher3/h0;
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->f:Lcom/android/launcher3/util/p3;

    .line 4
    .line 5
    if-eqz v1, :cond_6

    .line 6
    .line 7
    iget-object v2, v0, Lcom/android/launcher3/h0$a;->i:Ljava/lang/Boolean;

    .line 8
    .line 9
    if-nez v2, :cond_1

    .line 10
    .line 11
    iget-object v2, v0, Lcom/android/launcher3/h0$a;->c:Lcom/android/launcher3/util/Z$c;

    .line 12
    .line 13
    invoke-virtual {v2, v1}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->b:Lcom/android/launcher3/F1;

    .line 20
    .line 21
    iget-boolean v1, v1, Lcom/android/launcher3/F1;->C1:Z

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v1, 0x0

    .line 28
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iput-object v1, v0, Lcom/android/launcher3/h0$a;->i:Ljava/lang/Boolean;

    .line 33
    .line 34
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->j:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-nez v1, :cond_2

    .line 37
    .line 38
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->c:Lcom/android/launcher3/util/Z$c;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/util/Z$c;->n()Lcom/android/launcher3/util/C1;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    iget-boolean v1, v1, Lcom/android/launcher3/util/C1;->g:Z

    .line 45
    .line 46
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/android/launcher3/h0$a;->j:Ljava/lang/Boolean;

    .line 51
    .line 52
    :cond_2
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->l:Landroid/util/SparseArray;

    .line 53
    .line 54
    if-nez v1, :cond_3

    .line 55
    .line 56
    new-instance v1, Landroid/util/SparseArray;

    .line 57
    .line 58
    invoke-direct {v1}, Landroid/util/SparseArray;-><init>()V

    .line 59
    .line 60
    .line 61
    iput-object v1, v0, Lcom/android/launcher3/h0$a;->l:Landroid/util/SparseArray;

    .line 62
    .line 63
    :cond_3
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->k:Lcom/android/launcher3/h0$b;

    .line 64
    .line 65
    if-nez v1, :cond_4

    .line 66
    .line 67
    sget-object v1, Lcom/android/launcher3/h0;->B3:Lcom/android/launcher3/h0$b;

    .line 68
    .line 69
    iput-object v1, v0, Lcom/android/launcher3/h0$a;->k:Lcom/android/launcher3/h0$b;

    .line 70
    .line 71
    :cond_4
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->m:Ljava/util/function/Consumer;

    .line 72
    .line 73
    if-nez v1, :cond_5

    .line 74
    .line 75
    sget-object v1, Lcom/android/launcher3/h0;->C3:Ljava/util/function/Consumer;

    .line 76
    .line 77
    iput-object v1, v0, Lcom/android/launcher3/h0$a;->m:Ljava/util/function/Consumer;

    .line 78
    .line 79
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 80
    .line 81
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 82
    .line 83
    .line 84
    const-string v2, "build: mIsMultiWindowMode = "

    .line 85
    .line 86
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    iget-boolean v2, v0, Lcom/android/launcher3/h0$a;->h:Z

    .line 90
    .line 91
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v2, " mIsGestureMode="

    .line 95
    .line 96
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v2, v0, Lcom/android/launcher3/h0$a;->j:Ljava/lang/Boolean;

    .line 100
    .line 101
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const-string v2, "DeviceProfile.Builder"

    .line 109
    .line 110
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    .line 112
    .line 113
    new-instance v3, Lcom/android/launcher3/h0;

    .line 114
    .line 115
    iget-object v4, v0, Lcom/android/launcher3/h0$a;->a:Landroid/content/Context;

    .line 116
    .line 117
    iget-object v5, v0, Lcom/android/launcher3/h0$a;->b:Lcom/android/launcher3/F1;

    .line 118
    .line 119
    iget-object v6, v0, Lcom/android/launcher3/h0$a;->c:Lcom/android/launcher3/util/Z$c;

    .line 120
    .line 121
    iget-object v7, v0, Lcom/android/launcher3/h0$a;->d:Lcom/android/launcher3/util/window/d;

    .line 122
    .line 123
    iget-object v8, v0, Lcom/android/launcher3/h0$a;->e:Ln1/C;

    .line 124
    .line 125
    iget-object v9, v0, Lcom/android/launcher3/h0$a;->f:Lcom/android/launcher3/util/p3;

    .line 126
    .line 127
    iget-object v10, v0, Lcom/android/launcher3/h0$a;->l:Landroid/util/SparseArray;

    .line 128
    .line 129
    iget-boolean v11, v0, Lcom/android/launcher3/h0$a;->h:Z

    .line 130
    .line 131
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->i:Ljava/lang/Boolean;

    .line 132
    .line 133
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 134
    .line 135
    .line 136
    move-result v12

    .line 137
    iget-boolean v13, v0, Lcom/android/launcher3/h0$a;->g:Z

    .line 138
    .line 139
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->j:Ljava/lang/Boolean;

    .line 140
    .line 141
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 142
    .line 143
    .line 144
    move-result v14

    .line 145
    iget-object v15, v0, Lcom/android/launcher3/h0$a;->k:Lcom/android/launcher3/h0$b;

    .line 146
    .line 147
    iget-object v1, v0, Lcom/android/launcher3/h0$a;->m:Ljava/util/function/Consumer;

    .line 148
    .line 149
    iget-boolean v0, v0, Lcom/android/launcher3/h0$a;->n:Z

    .line 150
    .line 151
    move/from16 v17, v0

    .line 152
    .line 153
    move-object/from16 v16, v1

    .line 154
    .line 155
    invoke-direct/range {v3 .. v17}, Lcom/android/launcher3/h0;-><init>(Landroid/content/Context;Lcom/android/launcher3/F1;Lcom/android/launcher3/util/Z$c;Lcom/android/launcher3/util/window/d;Ln1/C;Lcom/android/launcher3/util/p3;Landroid/util/SparseArray;ZZZZLcom/android/launcher3/h0$b;Ljava/util/function/Consumer;Z)V

    .line 156
    .line 157
    .line 158
    return-object v3

    .line 159
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 160
    .line 161
    const-string v1, "Window bounds not set"

    .line 162
    .line 163
    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    throw v0
.end method

.method public b(Landroid/util/SparseArray;)Lcom/android/launcher3/h0$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/SparseArray<",
            "Ls1/m;",
            ">;)",
            "Lcom/android/launcher3/h0$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->l:Landroid/util/SparseArray;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Z)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->j:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public d(Z)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/h0$a;->g:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public e(Z)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/h0$a;->n:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Z)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/h0$a;->h:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public g(Z)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->i:Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public h(Lcom/android/launcher3/h0$b;)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->k:Lcom/android/launcher3/h0$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(Lcom/android/launcher3/util/p3;)Lcom/android/launcher3/h0$a;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->f:Lcom/android/launcher3/util/p3;

    .line 2
    .line 3
    return-object p0
.end method

.method public j(Ljava/util/function/Consumer;)Lcom/android/launcher3/h0$a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/h0;",
            ">;)",
            "Lcom/android/launcher3/h0$a;"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/h0$a;->m:Ljava/util/function/Consumer;

    .line 2
    .line 3
    return-object p0
.end method
