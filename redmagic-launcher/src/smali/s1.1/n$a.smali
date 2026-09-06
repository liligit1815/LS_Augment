.class Ls1/n$a;
.super Ljava/lang/Object;
.source "DynamicIconResourceMfv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field private a:Z

.field private b:I

.field private c:I

.field private d:I

.field private e:I


# direct methods
.method public constructor <init>(Ls1/n;)V
    .locals 7

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    .line 1
    invoke-direct/range {v0 .. v6}, Ls1/n$a;-><init>(Ls1/n;ZIIII)V

    return-void
.end method

.method public constructor <init>(Ls1/n;ZIIII)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-boolean p2, p0, Ls1/n$a;->a:Z

    .line 4
    iput p3, p0, Ls1/n$a;->b:I

    .line 5
    iput p4, p0, Ls1/n$a;->c:I

    .line 6
    iput p5, p0, Ls1/n$a;->d:I

    .line 7
    iput p6, p0, Ls1/n$a;->e:I

    return-void
.end method

.method static bridge synthetic a(Ls1/n$a;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ls1/n$a;->a:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Ls1/n$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/n$a;->c:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic c(Ls1/n$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/n$a;->e:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Ls1/n$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/n$a;->b:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Ls1/n$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/n$a;->d:I

    .line 2
    .line 3
    return p0
.end method
