.class public final synthetic Lcom/android/launcher3/widget/L;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/P;

.field public final synthetic b:Z

.field public final synthetic c:Landroid/graphics/drawable/Drawable;

.field public final synthetic d:I

.field public final synthetic e:I

.field public final synthetic f:I

.field public final synthetic g:I

.field public final synthetic h:Lcom/android/launcher3/widget/U;

.field public final synthetic i:Lcom/android/launcher3/h0;

.field public final synthetic j:F


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/P;ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/L;->a:Lcom/android/launcher3/widget/P;

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/android/launcher3/widget/L;->b:Z

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/widget/L;->c:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    iput p4, p0, Lcom/android/launcher3/widget/L;->d:I

    .line 11
    .line 12
    iput p5, p0, Lcom/android/launcher3/widget/L;->e:I

    .line 13
    .line 14
    iput p6, p0, Lcom/android/launcher3/widget/L;->f:I

    .line 15
    .line 16
    iput p7, p0, Lcom/android/launcher3/widget/L;->g:I

    .line 17
    .line 18
    iput-object p8, p0, Lcom/android/launcher3/widget/L;->h:Lcom/android/launcher3/widget/U;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/android/launcher3/widget/L;->i:Lcom/android/launcher3/h0;

    .line 21
    .line 22
    iput p10, p0, Lcom/android/launcher3/widget/L;->j:F

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/L;->a:Lcom/android/launcher3/widget/P;

    .line 2
    .line 3
    iget-boolean v1, p0, Lcom/android/launcher3/widget/L;->b:Z

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/widget/L;->c:Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    iget v3, p0, Lcom/android/launcher3/widget/L;->d:I

    .line 8
    .line 9
    iget v4, p0, Lcom/android/launcher3/widget/L;->e:I

    .line 10
    .line 11
    iget v5, p0, Lcom/android/launcher3/widget/L;->f:I

    .line 12
    .line 13
    iget v6, p0, Lcom/android/launcher3/widget/L;->g:I

    .line 14
    .line 15
    iget-object v7, p0, Lcom/android/launcher3/widget/L;->h:Lcom/android/launcher3/widget/U;

    .line 16
    .line 17
    iget-object v8, p0, Lcom/android/launcher3/widget/L;->i:Lcom/android/launcher3/h0;

    .line 18
    .line 19
    iget v9, p0, Lcom/android/launcher3/widget/L;->j:F

    .line 20
    .line 21
    move-object v10, p1

    .line 22
    invoke-static/range {v0 .. v10}, Lcom/android/launcher3/widget/P;->d(Lcom/android/launcher3/widget/P;ZLandroid/graphics/drawable/Drawable;IIIILcom/android/launcher3/widget/U;Lcom/android/launcher3/h0;FLandroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
