.class public final Lc1/a;
.super Lcom/android/launcher3/util/C;
.source "CellInfo.kt"


# instance fields
.field public final e:Landroid/view/View;

.field public final f:I

.field public final g:I


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/android/launcher3/model/data/y;Lc1/c$a;)V
    .locals 4

    .line 1
    const-string v0, "info"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "cellPos"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget v0, p3, Lc1/c$a;->a:I

    .line 12
    .line 13
    iget v1, p3, Lc1/c$a;->b:I

    .line 14
    .line 15
    iget v2, p2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 16
    .line 17
    iget v3, p2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 18
    .line 19
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/android/launcher3/util/C;-><init>(IIII)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lc1/a;->e:Landroid/view/View;

    .line 23
    .line 24
    iget p1, p3, Lc1/c$a;->c:I

    .line 25
    .line 26
    iput p1, p0, Lc1/a;->f:I

    .line 27
    .line 28
    iget p1, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 29
    .line 30
    iput p1, p0, Lc1/a;->g:I

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lc1/a;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lc1/a;->e:Landroid/view/View;

    .line 2
    .line 3
    iget v1, p0, Lc1/a;->f:I

    .line 4
    .line 5
    iget p0, p0, Lc1/a;->g:I

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v3, "CellInfo(cell="

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v0, ", screenId="

    .line 21
    .line 22
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v0, ", container="

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string p0, ")"

    .line 37
    .line 38
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method
