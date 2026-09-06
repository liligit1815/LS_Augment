.class public Lh0/e;
.super Ljava/lang/Object;
.source "SliceActionImpl.java"

# interfaces
.implements Lh0/d;


# instance fields
.field private a:Landroid/app/PendingIntent;

.field private b:Landroidx/core/graphics/drawable/IconCompat;

.field private c:I

.field private d:Ljava/lang/CharSequence;

.field private e:Ljava/lang/CharSequence;

.field private f:Z

.field private g:Z

.field private h:I

.field private i:Landroidx/slice/SliceItem;

.field private j:Landroidx/slice/SliceItem;

.field private k:Z


# direct methods
.method public constructor <init>(Landroid/app/PendingIntent;Landroidx/core/graphics/drawable/IconCompat;ILjava/lang/CharSequence;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lh0/e;->h:I

    .line 3
    iput-object p1, p0, Lh0/e;->a:Landroid/app/PendingIntent;

    .line 4
    iput-object p2, p0, Lh0/e;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 5
    iput-object p4, p0, Lh0/e;->d:Ljava/lang/CharSequence;

    .line 6
    iput p3, p0, Lh0/e;->c:I

    return-void
.end method

.method public constructor <init>(Landroidx/slice/SliceItem;)V
    .locals 5

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x5

    .line 8
    iput v0, p0, Lh0/e;->c:I

    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lh0/e;->h:I

    .line 10
    iput-object p1, p0, Lh0/e;->i:Landroidx/slice/SliceItem;

    .line 11
    const-string v1, "action"

    invoke-static {p1, v1}, Lh0/f;->f(Landroidx/slice/SliceItem;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    .line 12
    :cond_0
    iput-object p1, p0, Lh0/e;->j:Landroidx/slice/SliceItem;

    .line 13
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->g()Landroid/app/PendingIntent;

    move-result-object v1

    iput-object v1, p0, Lh0/e;->a:Landroid/app/PendingIntent;

    .line 14
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    move-result-object v1

    const-string v2, "image"

    invoke-static {v1, v2}, Lh0/f;->c(Landroidx/slice/Slice;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 15
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->i()Landroidx/core/graphics/drawable/IconCompat;

    move-result-object v2

    iput-object v2, p0, Lh0/e;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 16
    invoke-static {v1}, Lh0/e;->f(Landroidx/slice/SliceItem;)I

    move-result v1

    iput v1, p0, Lh0/e;->c:I

    .line 17
    :cond_1
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    move-result-object v1

    const-string v2, "title"

    const/4 v3, 0x0

    const-string v4, "text"

    invoke-static {v1, v4, v2, v3}, Lh0/f;->d(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 18
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->m()Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lh0/e;->d:Ljava/lang/CharSequence;

    .line 19
    :cond_2
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    move-result-object v1

    const-string v2, "content_description"

    invoke-static {v1, v4, v2}, Lh0/f;->m(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 20
    invoke-virtual {v1}, Landroidx/slice/SliceItem;->p()Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lh0/e;->e:Ljava/lang/CharSequence;

    .line 21
    :cond_3
    const-string v1, "toggle"

    invoke-virtual {p1}, Landroidx/slice/SliceItem;->o()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    iput-boolean v1, p0, Lh0/e;->f:Z

    if-eqz v1, :cond_4

    .line 22
    const-string v1, "selected"

    invoke-virtual {p1, v1}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lh0/e;->g:Z

    .line 23
    :cond_4
    iget-object v1, p0, Lh0/e;->i:Landroidx/slice/SliceItem;

    const-string v2, "activity"

    invoke-virtual {v1, v2}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lh0/e;->k:Z

    .line 24
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->n()Landroidx/slice/Slice;

    move-result-object p1

    const-string v1, "int"

    const-string v2, "priority"

    invoke-static {p1, v1, v2}, Lh0/f;->m(Landroidx/slice/Slice;Ljava/lang/String;Ljava/lang/String;)Landroidx/slice/SliceItem;

    move-result-object p1

    if-eqz p1, :cond_5

    .line 25
    invoke-virtual {p1}, Landroidx/slice/SliceItem;->j()I

    move-result v0

    :cond_5
    iput v0, p0, Lh0/e;->h:I

    return-void
.end method

.method public static f(Landroidx/slice/SliceItem;)I
    .locals 2

    .line 1
    const-string v0, "no_tint"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    const-string v0, "raw"

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const-string v1, "large"

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    return p0

    .line 29
    :cond_1
    const/4 p0, 0x3

    .line 30
    return p0

    .line 31
    :cond_2
    invoke-virtual {p0, v1}, Landroidx/slice/SliceItem;->r(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 p0, 0x2

    .line 38
    return p0

    .line 39
    :cond_3
    const/4 p0, 0x1

    .line 40
    return p0
.end method


# virtual methods
.method public a()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lh0/e;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public b()I
    .locals 0

    .line 1
    iget p0, p0, Lh0/e;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, Lh0/e;->h:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lh0/e;->j:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroidx/slice/SliceItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lh0/e;->i:Landroidx/slice/SliceItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIcon()Landroidx/core/graphics/drawable/IconCompat;
    .locals 0

    .line 1
    iget-object p0, p0, Lh0/e;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 2
    .line 3
    return-object p0
.end method
