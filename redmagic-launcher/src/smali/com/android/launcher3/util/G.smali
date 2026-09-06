.class public Lcom/android/launcher3/util/G;
.super Ljava/lang/Object;
.source "ContentWriter.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/G$a;
    }
.end annotation


# instance fields
.field private final g:Landroid/content/ContentValues;

.field private final h:Landroid/content/Context;

.field private i:Lcom/android/launcher3/util/G$a;

.field private j:Ls1/d;

.field private k:Landroid/os/UserHandle;


# direct methods
.method public constructor <init>(Landroid/content/ContentValues;Landroid/content/Context;)V
    .locals 0

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object p1, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/util/G;->h:Landroid/content/Context;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 3
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/ContentValues;Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/G$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/G;-><init>(Landroid/content/Context;)V

    .line 2
    iput-object p2, p0, Lcom/android/launcher3/util/G;->i:Lcom/android/launcher3/util/G$a;

    return-void
.end method


# virtual methods
.method public b()I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->i:Lcom/android/launcher3/util/G$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/android/launcher3/util/G$a;->a:Lz1/k2;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/util/G;->h:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/android/launcher3/util/G;->c(Landroid/content/Context;)Landroid/content/ContentValues;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object p0, p0, Lcom/android/launcher3/util/G;->i:Lcom/android/launcher3/util/G$a;

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/util/G$a;->b:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/android/launcher3/util/G$a;->c:[Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2, p0}, Lz1/k2;->m0(Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public c(Landroid/content/Context;)Landroid/content/ContentValues;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/util/G;->k:Landroid/os/UserHandle;

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Lt1/f;->G(Ls1/d;Landroid/os/UserHandle;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 37
    .line 38
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 39
    .line 40
    invoke-static {v0}, Ls1/q;->b(Landroid/graphics/Bitmap;)[B

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const-string v1, "icon"

    .line 45
    .line 46
    invoke-virtual {p1, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 47
    .line 48
    .line 49
    const/4 p1, 0x0

    .line 50
    iput-object p1, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 51
    .line 52
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 53
    .line 54
    return-object p0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/ContentValues;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 23
    .line 24
    iget-object v0, v0, Ls1/d;->a:Landroid/graphics/Bitmap;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 v0, 0x0

    .line 30
    iput-object v0, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/android/launcher3/util/G;->i:Lcom/android/launcher3/util/G$a;

    .line 33
    .line 34
    return-void
.end method

.method public d(Ljava/lang/String;Landroid/content/Intent;)Lcom/android/launcher3/util/G;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p2, v1}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-object p0
.end method

.method public e(Ljava/lang/String;Landroid/os/UserHandle;)Lcom/android/launcher3/util/G;
    .locals 2

    .line 1
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/util/G;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, LD1/t;

    .line 10
    .line 11
    invoke-virtual {v0, p2}, LD1/t;->m(Landroid/os/UserHandle;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/util/G;->n(Ljava/lang/String;Ljava/lang/Long;)Lcom/android/launcher3/util/G;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public g(Ljava/lang/String;Ljava/lang/CharSequence;)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    :goto_0
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public n(Ljava/lang/String;Ljava/lang/Long;)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public t(Ljava/lang/String;Ljava/lang/String;)Lcom/android/launcher3/util/G;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/G;->g:Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public v(Ls1/d;Landroid/os/UserHandle;)Lcom/android/launcher3/util/G;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/util/G;->j:Ls1/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/util/G;->k:Landroid/os/UserHandle;

    .line 4
    .line 5
    return-object p0
.end method
