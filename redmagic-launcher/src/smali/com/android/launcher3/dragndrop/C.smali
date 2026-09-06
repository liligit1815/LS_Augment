.class public final synthetic Lcom/android/launcher3/dragndrop/C;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ls1/e;


# instance fields
.field public final synthetic a:Landroid/graphics/Bitmap;

.field public final synthetic b:F

.field public final synthetic c:Landroid/graphics/Paint;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/Bitmap;FLandroid/graphics/Paint;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/dragndrop/C;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/dragndrop/C;->b:F

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/dragndrop/C;->c:Landroid/graphics/Paint;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final c(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/dragndrop/C;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/dragndrop/C;->b:F

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/dragndrop/C;->c:Landroid/graphics/Paint;

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/launcher3/dragndrop/E;->a(Landroid/graphics/Bitmap;FLandroid/graphics/Paint;Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
