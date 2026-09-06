.class Ls1/j$c$a;
.super Ls1/o$b;
.source "ClockDrawableWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/j$c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field private final e:F

.field private final f:Ls1/j$a;

.field private final g:Landroid/graphics/Bitmap;

.field private final h:Landroid/graphics/ColorFilter;

.field private final i:I


# direct methods
.method constructor <init>(Ls1/d;IFLs1/j$a;Landroid/graphics/Bitmap;Landroid/graphics/ColorFilter;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/o$b;-><init>(Ls1/d;)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Ls1/j$c$a;->e:F

    .line 5
    .line 6
    iput-object p4, p0, Ls1/j$c$a;->f:Ls1/j$a;

    .line 7
    .line 8
    iput-object p5, p0, Ls1/j$c$a;->g:Landroid/graphics/Bitmap;

    .line 9
    .line 10
    iput-object p6, p0, Ls1/j$c$a;->h:Landroid/graphics/ColorFilter;

    .line 11
    .line 12
    iput p2, p0, Ls1/j$c$a;->i:I

    .line 13
    .line 14
    return-void
.end method

.method static bridge synthetic d(Ls1/j$c$a;)Ls1/j$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/j$c$a;->f:Ls1/j$a;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Ls1/j$c$a;)Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/j$c$a;->g:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic f(Ls1/j$c$a;)Landroid/graphics/ColorFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/j$c$a;->h:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Ls1/j$c$a;)F
    .locals 0

    .line 1
    iget p0, p0, Ls1/j$c$a;->e:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic h(Ls1/j$c$a;)I
    .locals 0

    .line 1
    iget p0, p0, Ls1/j$c$a;->i:I

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public b()Ls1/o;
    .locals 1

    .line 1
    new-instance v0, Ls1/j$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ls1/j$c;-><init>(Ls1/j$c$a;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
