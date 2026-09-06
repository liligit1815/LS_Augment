.class public final synthetic Lcom/android/launcher3/widget/picker/o0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;

.field public final synthetic b:Lcom/android/launcher3/widget/picker/e0;

.field public final synthetic c:Lm2/h;

.field public final synthetic d:Z


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;Lcom/android/launcher3/widget/picker/e0;Lm2/h;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/picker/o0;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/picker/o0;->b:Lcom/android/launcher3/widget/picker/e0;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/android/launcher3/widget/picker/o0;->c:Lm2/h;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/android/launcher3/widget/picker/o0;->d:Z

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/picker/o0;->a:Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/widget/picker/o0;->b:Lcom/android/launcher3/widget/picker/e0;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/android/launcher3/widget/picker/o0;->c:Lm2/h;

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/android/launcher3/widget/picker/o0;->d:Z

    .line 8
    .line 9
    check-cast p1, Landroid/util/Pair;

    .line 10
    .line 11
    invoke-static {v0, v1, v2, p0, p1}, Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;->c(Lcom/android/launcher3/widget/picker/WidgetsTwoPaneSheet$b;Lcom/android/launcher3/widget/picker/e0;Lm2/h;ZLandroid/util/Pair;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
