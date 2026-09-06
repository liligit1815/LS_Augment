.class public final Lu1/b;
.super Ljava/lang/Object;
.source "MonoThemedBitmap.kt"

# interfaces
.implements Ls1/p0;


# instance fields
.field private final a:Landroid/graphics/Bitmap;

.field private final b:Landroid/graphics/Bitmap;

.field private final c:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroid/content/Context;",
            "[I>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;Lu4/l;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Bitmap;",
            "Landroid/graphics/Bitmap;",
            "Lu4/l<",
            "-",
            "Landroid/content/Context;",
            "[I>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "mono"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "whiteShadowLayer"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "colorProvider"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 20
    .line 21
    iput-object p2, p0, Lu1/b;->b:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    iput-object p3, p0, Lu1/b;->c:Lu4/l;

    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public a(Ls1/d;Landroid/content/Context;)Ls1/o;
    .locals 6

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "context"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lu1/b;->c:Lu4/l;

    .line 12
    .line 13
    invoke-interface {v0, p2}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    check-cast p2, [I

    .line 18
    .line 19
    new-instance v0, Lu1/c$b;

    .line 20
    .line 21
    iget-object v2, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 22
    .line 23
    iget-object v3, p0, Lu1/b;->b:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    aget v4, p2, p0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    aget v5, p2, p0

    .line 30
    .line 31
    move-object v1, p1

    .line 32
    invoke-direct/range {v0 .. v5}, Lu1/c$b;-><init>(Ls1/d;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ls1/o$b;->c()Ls1/o;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "newDrawable(...)"

    .line 40
    .line 41
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-object p0
.end method

.method public final b()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method public serialize()[B
    .locals 2

    .line 1
    iget-object v0, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    mul-int/2addr v0, v1

    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    iget-object p0, p0, Lu1/b;->a:Landroid/graphics/Bitmap;

    .line 17
    .line 18
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, v1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method
