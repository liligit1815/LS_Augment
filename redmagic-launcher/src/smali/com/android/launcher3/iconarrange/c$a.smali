.class Lcom/android/launcher3/iconarrange/c$a;
.super Ljava/lang/Object;
.source "IconArrangePreviewItemAnim.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/c;-><init>(Lcom/android/launcher3/C2;ILcom/android/launcher3/folder/Folder;Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/n0$a;Lcom/android/launcher3/iconarrange/b;IIIIFFI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:I

.field final synthetic i:I

.field final synthetic j:I

.field final synthetic k:F

.field final synthetic l:F

.field final synthetic m:Lcom/android/launcher3/n0$a;

.field final synthetic n:Lcom/android/launcher3/iconarrange/c;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/c;IIIIFFLcom/android/launcher3/n0$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/c$a;->n:Lcom/android/launcher3/iconarrange/c;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/iconarrange/c$a;->g:I

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/iconarrange/c$a;->h:I

    .line 6
    .line 7
    iput p4, p0, Lcom/android/launcher3/iconarrange/c$a;->i:I

    .line 8
    .line 9
    iput p5, p0, Lcom/android/launcher3/iconarrange/c$a;->j:I

    .line 10
    .line 11
    iput p6, p0, Lcom/android/launcher3/iconarrange/c$a;->k:F

    .line 12
    .line 13
    iput p7, p0, Lcom/android/launcher3/iconarrange/c$a;->l:F

    .line 14
    .line 15
    iput-object p8, p0, Lcom/android/launcher3/iconarrange/c$a;->m:Lcom/android/launcher3/n0$a;

    .line 16
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedFraction()F

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c$a;->n:Lcom/android/launcher3/iconarrange/c;

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/iconarrange/c;->a(Lcom/android/launcher3/iconarrange/c;)Lcom/android/launcher3/iconarrange/b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, p0, Lcom/android/launcher3/iconarrange/c$a;->g:I

    .line 12
    .line 13
    int-to-float v2, v1

    .line 14
    iget v3, p0, Lcom/android/launcher3/iconarrange/c$a;->h:I

    .line 15
    .line 16
    sub-int/2addr v3, v1

    .line 17
    int-to-float v1, v3

    .line 18
    mul-float/2addr v1, p1

    .line 19
    add-float/2addr v2, v1

    .line 20
    invoke-virtual {v0, v2}, Lcom/android/launcher3/iconarrange/b;->i(F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c$a;->n:Lcom/android/launcher3/iconarrange/c;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/android/launcher3/iconarrange/c;->a(Lcom/android/launcher3/iconarrange/c;)Lcom/android/launcher3/iconarrange/b;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget v1, p0, Lcom/android/launcher3/iconarrange/c$a;->i:I

    .line 30
    .line 31
    int-to-float v2, v1

    .line 32
    iget v3, p0, Lcom/android/launcher3/iconarrange/c$a;->j:I

    .line 33
    .line 34
    sub-int/2addr v3, v1

    .line 35
    int-to-float v1, v3

    .line 36
    mul-float/2addr v1, p1

    .line 37
    add-float/2addr v2, v1

    .line 38
    invoke-virtual {v0, v2}, Lcom/android/launcher3/iconarrange/b;->j(F)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/c$a;->n:Lcom/android/launcher3/iconarrange/c;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/android/launcher3/iconarrange/c;->a(Lcom/android/launcher3/iconarrange/c;)Lcom/android/launcher3/iconarrange/b;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget v1, p0, Lcom/android/launcher3/iconarrange/c$a;->k:F

    .line 48
    .line 49
    iget v2, p0, Lcom/android/launcher3/iconarrange/c$a;->l:F

    .line 50
    .line 51
    sub-float/2addr v2, v1

    .line 52
    mul-float/2addr p1, v2

    .line 53
    add-float/2addr v1, p1

    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/iconarrange/b;->h(F)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/c$a;->m:Lcom/android/launcher3/n0$a;

    .line 58
    .line 59
    iget-object p0, p0, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 62
    .line 63
    .line 64
    return-void
.end method
