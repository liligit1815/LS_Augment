.class Lz1/J3$f;
.super Lz1/J3$e;
.source "ModelWriter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lz1/J3;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "f"
.end annotation


# instance fields
.field private final l:Lcom/android/launcher3/model/data/y;

.field private final m:Ljava/util/function/Supplier;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/util/G;",
            ">;"
        }
    .end annotation
.end field

.field private final n:I

.field private final o:Ljava/lang/String;

.field final synthetic p:Lz1/J3;


# direct methods
.method constructor <init>(Lz1/J3;Lcom/android/launcher3/model/data/y;Ljava/util/function/Supplier;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/function/Supplier<",
            "Lcom/android/launcher3/util/G;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lz1/J3$f;->p:Lz1/J3;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lz1/J3$e;-><init>(Lz1/J3;)V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lz1/J3$f;->l:Lcom/android/launcher3/model/data/y;

    .line 7
    .line 8
    iput-object p3, p0, Lz1/J3$f;->m:Ljava/util/function/Supplier;

    .line 9
    .line 10
    iget p1, p2, Lcom/android/launcher3/model/data/y;->id:I

    .line 11
    .line 12
    iput p1, p0, Lz1/J3$f;->n:I

    .line 13
    .line 14
    iput-object p4, p0, Lz1/J3$f;->o:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public b()V
    .locals 6

    .line 1
    sget-object v0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lz1/J3$f;->o:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "ModelWriter"

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v2, "runImpl: item return!!! mTableName: "

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lz1/J3$f;->o:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p0, " ,curTableName: "

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    sget-object p0, Lcom/android/launcher3/S3;->a:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_0
    :try_start_0
    iget-object v0, p0, Lz1/J3$f;->m:Ljava/util/function/Supplier;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/function/Supplier;->get()Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Lcom/android/launcher3/util/G;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    :try_start_1
    iget-object v2, p0, Lz1/J3$f;->p:Lz1/J3;

    .line 55
    .line 56
    invoke-static {v2}, Lz1/J3;->s(Lz1/J3;)Lcom/android/launcher3/D3;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget-object v3, p0, Lz1/J3$f;->p:Lz1/J3;

    .line 65
    .line 66
    invoke-static {v3}, Lz1/J3;->r(Lz1/J3;)Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/G;->c(Landroid/content/Context;)Landroid/content/ContentValues;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    iget v4, p0, Lz1/J3$f;->n:I

    .line 75
    .line 76
    invoke-static {v4}, LE1/a;->c(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    const/4 v5, 0x0

    .line 81
    invoke-virtual {v2, v3, v4, v5}, Lz1/k2;->m0(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    iget-object v2, p0, Lz1/J3$f;->l:Lcom/android/launcher3/model/data/y;

    .line 85
    .line 86
    iget v3, p0, Lz1/J3$f;->n:I

    .line 87
    .line 88
    invoke-virtual {p0, v2, v3}, Lz1/J3$e;->c(Lcom/android/launcher3/model/data/y;I)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lz1/J3$f;->l:Lcom/android/launcher3/model/data/y;

    .line 92
    .line 93
    if-eqz v2, :cond_1

    .line 94
    .line 95
    iget v2, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 96
    .line 97
    if-lez v2, :cond_1

    .line 98
    .line 99
    new-instance v2, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v3, "run: UpdateItemRunnable mItem = "

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v3, p0, Lz1/J3$f;->l:Lcom/android/launcher3/model/data/y;

    .line 110
    .line 111
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v3, ",container = "

    .line 119
    .line 120
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    iget-object p0, p0, Lz1/J3$f;->l:Lcom/android/launcher3/model/data/y;

    .line 124
    .line 125
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 126
    .line 127
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 135
    .line 136
    .line 137
    goto :goto_0

    .line 138
    :catchall_0
    move-exception p0

    .line 139
    goto :goto_1

    .line 140
    :cond_1
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :goto_1
    if-eqz v0, :cond_2

    .line 145
    .line 146
    :try_start_3
    invoke-virtual {v0}, Lcom/android/launcher3/util/G;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 147
    .line 148
    .line 149
    goto :goto_2

    .line 150
    :catchall_1
    move-exception v0

    .line 151
    :try_start_4
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 152
    .line 153
    .line 154
    :cond_2
    :goto_2
    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 155
    :catch_0
    move-exception p0

    .line 156
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 157
    .line 158
    .line 159
    return-void
.end method
