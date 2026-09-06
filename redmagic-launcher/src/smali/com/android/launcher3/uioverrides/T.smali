.class public final synthetic Lcom/android/launcher3/uioverrides/T;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/android/launcher3/V3;

.field public final synthetic b:Lcom/android/launcher3/uioverrides/U;


# direct methods
.method public synthetic constructor <init>(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/T;->a:Lcom/android/launcher3/V3;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/launcher3/uioverrides/T;->b:Lcom/android/launcher3/uioverrides/U;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/T;->a:Lcom/android/launcher3/V3;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/uioverrides/T;->b:Lcom/android/launcher3/uioverrides/U;

    .line 4
    .line 5
    check-cast p1, Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/uioverrides/U;->b(Lcom/android/launcher3/V3;Lcom/android/launcher3/uioverrides/U;Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
