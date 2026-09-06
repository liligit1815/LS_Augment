.class Lcom/android/launcher3/views/f$d;
.super Landroid/util/FloatProperty;
.source "AbstractSlideInView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/views/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lcom/android/launcher3/views/f<",
        "*>;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/util/FloatProperty;-><init>(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/views/f;)Ljava/lang/Float;
    .locals 0

    .line 1
    iget p0, p1, Lcom/android/launcher3/views/f;->B:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(Lcom/android/launcher3/views/f;F)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Lcom/android/launcher3/views/f;->setTranslationShiftX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/f;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/views/f$d;->a(Lcom/android/launcher3/views/f;)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic setValue(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/views/f;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/views/f$d;->b(Lcom/android/launcher3/views/f;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
