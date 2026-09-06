.class public LG/g$b;
.super Ljava/lang/Object;
.source "FontsContractCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LG/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field private final a:Landroid/net/Uri;

.field private final b:I

.field private final c:I

.field private final d:Z

.field private final e:I


# direct methods
.method public constructor <init>(Landroid/net/Uri;IIZI)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, LI/h;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Landroid/net/Uri;

    .line 9
    .line 10
    iput-object p1, p0, LG/g$b;->a:Landroid/net/Uri;

    .line 11
    .line 12
    iput p2, p0, LG/g$b;->b:I

    .line 13
    .line 14
    iput p3, p0, LG/g$b;->c:I

    .line 15
    .line 16
    iput-boolean p4, p0, LG/g$b;->d:Z

    .line 17
    .line 18
    iput p5, p0, LG/g$b;->e:I

    .line 19
    .line 20
    return-void
.end method

.method static a(Landroid/net/Uri;IIZI)LG/g$b;
    .locals 6

    .line 1
    new-instance v0, LG/g$b;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, LG/g$b;-><init>(Landroid/net/Uri;IIZI)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    iget p0, p0, LG/g$b;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, LG/g$b;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public d()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, LG/g$b;->a:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget p0, p0, LG/g$b;->c:I

    .line 2
    .line 3
    return p0
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LG/g$b;->d:Z

    .line 2
    .line 3
    return p0
.end method
