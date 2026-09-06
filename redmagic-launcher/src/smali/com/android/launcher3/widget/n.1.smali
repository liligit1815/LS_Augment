.class public final synthetic Lcom/android/launcher3/widget/n;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/widget/o;

.field public final synthetic b:Lcom/android/launcher3/W4;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/widget/n;->a:Lcom/android/launcher3/widget/o;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/n;->b:Lcom/android/launcher3/W4;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/n;->a:Lcom/android/launcher3/widget/o;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/widget/n;->b:Lcom/android/launcher3/W4;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/widget/o;->p0(Lcom/android/launcher3/widget/o;Lcom/android/launcher3/W4;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
