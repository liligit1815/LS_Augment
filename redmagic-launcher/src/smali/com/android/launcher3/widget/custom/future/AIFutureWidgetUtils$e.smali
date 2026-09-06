.class Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$e;
.super Ljava/util/ArrayList;
.source "AIFutureWidgetUtils.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils$WidgetData;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->s:Ljava/util/List;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->t:Ljava/util/List;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
