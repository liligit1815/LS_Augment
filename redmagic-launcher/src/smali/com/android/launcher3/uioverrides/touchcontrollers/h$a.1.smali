.class Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;
.super Ljava/lang/Object;
.source "NavBarToHomeTouchController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/uioverrides/touchcontrollers/h;->onDragEnd(F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$g<",
        "Lcom/android/launcher3/V3;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/uioverrides/touchcontrollers/h;


# direct methods
.method constructor <init>(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/V3;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->f(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)Lcom/android/launcher3/C2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/android/launcher3/C2;->e4(Lcom/android/launcher3/V3;)V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;->g:Lcom/android/launcher3/uioverrides/touchcontrollers/h;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/h;->f(Lcom/android/launcher3/uioverrides/touchcontrollers/h;)Lcom/android/launcher3/C2;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/uioverrides/touchcontrollers/h$a;->a(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
