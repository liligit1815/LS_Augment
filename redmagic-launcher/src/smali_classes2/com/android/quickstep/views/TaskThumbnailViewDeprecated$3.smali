.class Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$3;
.super Landroid/util/IntProperty;
.source "TaskThumbnailViewDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/IntProperty<",
        "Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/IntProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public get(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)Ljava/lang/Integer;
    .locals 0

    .line 2
    invoke-static {p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->c(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)Landroid/graphics/Paint;

    move-result-object p0

    invoke-virtual {p0}, Landroid/graphics/Paint;->getColor()I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    invoke-virtual {p0, p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$3;->get(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method public setValue(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;I)V
    .locals 0

    .line 2
    invoke-static {p1}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;->c(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;)Landroid/graphics/Paint;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;

    invoke-virtual {p0, p1, p2}, Lcom/android/quickstep/views/TaskThumbnailViewDeprecated$3;->setValue(Lcom/android/quickstep/views/TaskThumbnailViewDeprecated;I)V

    return-void
.end method
