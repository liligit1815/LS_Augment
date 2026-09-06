.class Lcom/android/launcher3/folder/u0$v;
.super Ljava/lang/Object;
.source "PreviewBackground.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/folder/u0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "v"
.end annotation


# instance fields
.field private a:F

.field private b:I

.field final synthetic c:Lcom/android/launcher3/folder/u0;


# direct methods
.method private constructor <init>(Lcom/android/launcher3/folder/u0;IF)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/folder/u0$v;->c:Lcom/android/launcher3/folder/u0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput p3, p0, Lcom/android/launcher3/folder/u0$v;->a:F

    .line 4
    iput p2, p0, Lcom/android/launcher3/folder/u0$v;->b:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/folder/u0;IFLcom/android/launcher3/folder/w0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/folder/u0$v;-><init>(Lcom/android/launcher3/folder/u0;IF)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/folder/u0$v;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/u0$v;->a:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/folder/u0$v;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/u0$v;->c(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private c(F)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/u0$v;->a:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/folder/u0$v;->c:Lcom/android/launcher3/folder/u0;

    .line 4
    .line 5
    iget v1, p0, Lcom/android/launcher3/folder/u0$v;->b:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    mul-float/2addr p1, v1

    .line 9
    float-to-int p1, p1

    .line 10
    invoke-static {v0, p1}, Lcom/android/launcher3/folder/u0;->G(Lcom/android/launcher3/folder/u0;I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/android/launcher3/folder/u0$v;->c:Lcom/android/launcher3/folder/u0;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/u0$v;->c:Lcom/android/launcher3/folder/u0;

    .line 22
    .line 23
    invoke-static {p0}, Lcom/android/launcher3/folder/u0;->q(Lcom/android/launcher3/folder/u0;)Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method
