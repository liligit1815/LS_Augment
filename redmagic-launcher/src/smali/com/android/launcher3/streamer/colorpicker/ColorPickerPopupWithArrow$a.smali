.class Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow$a;
.super Landroid/view/ViewOutlineProvider;
.source "ColorPickerPopupWithArrow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;


# direct methods
.method constructor <init>(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow$a;->a:Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow$a;->a:Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;->R(Lcom/android/launcher3/streamer/colorpicker/ColorPickerPopupWithArrow;)F

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    move-object v0, p2

    .line 18
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
