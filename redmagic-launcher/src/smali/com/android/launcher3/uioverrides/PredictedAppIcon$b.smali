.class Lcom/android/launcher3/uioverrides/PredictedAppIcon$b;
.super Landroid/util/FloatProperty;
.source "PredictedAppIcon.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/uioverrides/PredictedAppIcon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/FloatProperty<",
        "Lcom/android/launcher3/uioverrides/PredictedAppIcon;",
        ">;"
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
.method public a(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->f1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Lcom/android/launcher3/uioverrides/PredictedAppIcon;F)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->i1(Lcom/android/launcher3/uioverrides/PredictedAppIcon;F)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/widget/TextView;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$b;->a(Lcom/android/launcher3/uioverrides/PredictedAppIcon;)Ljava/lang/Float;

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
    check-cast p1, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/uioverrides/PredictedAppIcon$b;->b(Lcom/android/launcher3/uioverrides/PredictedAppIcon;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
