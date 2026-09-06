.class Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$c;
.super Ljava/util/HashMap;
.source "AICustomWidgetBottomEventLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/HashMap<",
        "Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;",
        "Ljava/lang/Class<",
        "+",
        "Lcom/android/launcher3/widget/custom/ai/data/AIWidgetBottomEventData;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->i:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 5
    .line 6
    const-class v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTodoData;

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->h:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 12
    .line 13
    const-class v1, Lcom/android/launcher3/widget/custom/ai/data/AIWidgetTravelData;

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;->g:Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$e;

    .line 19
    .line 20
    const-class v1, Lcom/android/launcher3/widget/custom/ai/AICustomWidgetBottomEventLayout$f;

    .line 21
    .line 22
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method
