.class public Lk1/a;
.super Ljava/lang/Object;
.source "DotInfo.java"


# instance fields
.field private final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LA1/d;",
            ">;"
        }
    .end annotation
.end field

.field private b:I

.field private c:Lcom/android/launcher3/util/L1;


# direct methods
.method public constructor <init>()V
    .locals 1

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
    iput-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(LA1/d;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Lk1/a;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, LA1/d;

    .line 19
    .line 20
    :goto_0
    if-eqz v0, :cond_2

    .line 21
    .line 22
    iget v1, v0, LA1/d;->d:I

    .line 23
    .line 24
    iget p1, p1, LA1/d;->d:I

    .line 25
    .line 26
    if-ne v1, p1, :cond_1

    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return p0

    .line 30
    :cond_1
    iget v2, p0, Lk1/a;->b:I

    .line 31
    .line 32
    sub-int/2addr v2, v1

    .line 33
    add-int/2addr v2, p1

    .line 34
    iput v2, p0, Lk1/a;->b:I

    .line 35
    .line 36
    iput p1, v0, LA1/d;->d:I

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_2
    iget-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    iget v1, p0, Lk1/a;->b:I

    .line 49
    .line 50
    iget p1, p1, LA1/d;->d:I

    .line 51
    .line 52
    add-int/2addr v1, p1

    .line 53
    iput v1, p0, Lk1/a;->b:I

    .line 54
    .line 55
    :cond_3
    return v0
.end method

.method public b(Lcom/android/launcher3/util/L1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lk1/a;->c:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    return-void
.end method

.method public c()Lcom/android/launcher3/util/L1;
    .locals 0

    .line 1
    iget-object p0, p0, Lk1/a;->c:Lcom/android/launcher3/util/L1;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()I
    .locals 1

    .line 1
    iget p0, p0, Lk1/a;->b:I

    .line 2
    .line 3
    const/16 v0, 0x3e8

    .line 4
    .line 5
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LA1/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lk1/a;->a:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(LA1/d;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v1, p0, Lk1/a;->b:I

    .line 10
    .line 11
    iget p1, p1, LA1/d;->d:I

    .line 12
    .line 13
    sub-int/2addr v1, p1

    .line 14
    iput v1, p0, Lk1/a;->b:I

    .line 15
    .line 16
    :cond_0
    return v0
.end method

.method public g(Lk1/a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput p1, p0, Lk1/a;->b:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Lk1/a;->a:Ljava/util/List;

    .line 13
    .line 14
    invoke-virtual {p1}, Lk1/a;->e()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lk1/a;->d()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lk1/a;->b:I

    .line 26
    .line 27
    invoke-virtual {p1}, Lk1/a;->c()Lcom/android/launcher3/util/L1;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lk1/a;->c:Lcom/android/launcher3/util/L1;

    .line 32
    .line 33
    return-void
.end method

.method public h(I)V
    .locals 0

    .line 1
    iput p1, p0, Lk1/a;->b:I

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget p0, p0, Lk1/a;->b:I

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
