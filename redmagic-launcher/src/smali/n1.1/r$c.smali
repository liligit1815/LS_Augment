.class public Ln1/r$c;
.super Ls1/o$b;
.source "PreloadIconDrawable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ln1/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "c"
.end annotation


# instance fields
.field protected final e:Lcom/android/launcher3/model/data/z;

.field protected final f:I

.field protected final g:[I

.field protected final h:Z

.field protected final i:I

.field private final j:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Ls1/d;Lcom/android/launcher3/model/data/z;I[IZLandroid/graphics/Path;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ls1/o$b;-><init>(Ls1/d;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ln1/r$c;->e:Lcom/android/launcher3/model/data/z;

    .line 5
    .line 6
    iput p3, p0, Ln1/r$c;->f:I

    .line 7
    .line 8
    iput-object p4, p0, Ln1/r$c;->g:[I

    .line 9
    .line 10
    iput-boolean p5, p0, Ln1/r$c;->h:Z

    .line 11
    .line 12
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/z;->y()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Ln1/r$c;->i:I

    .line 17
    .line 18
    iput-object p6, p0, Ln1/r$c;->j:Landroid/graphics/Path;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public bridge synthetic b()Ls1/o;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ln1/r$c;->d()Ln1/r;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Ln1/r;
    .locals 6

    .line 1
    new-instance v0, Ln1/r;

    .line 2
    .line 3
    iget-object v1, p0, Ln1/r$c;->e:Lcom/android/launcher3/model/data/z;

    .line 4
    .line 5
    iget v2, p0, Ln1/r$c;->f:I

    .line 6
    .line 7
    iget-object v3, p0, Ln1/r$c;->g:[I

    .line 8
    .line 9
    iget-boolean v4, p0, Ln1/r$c;->h:Z

    .line 10
    .line 11
    iget-object v5, p0, Ln1/r$c;->j:Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct/range {v0 .. v5}, Ln1/r;-><init>(Lcom/android/launcher3/model/data/z;I[IZLandroid/graphics/Path;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method
