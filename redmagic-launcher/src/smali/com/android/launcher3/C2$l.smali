.class Lcom/android/launcher3/C2$l;
.super Ljava/lang/Object;
.source "Launcher.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$g;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/C2;->J4(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/model/data/A;Lc1/c$a;)V
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
.field final synthetic g:Lcom/android/launcher3/widget/T;

.field final synthetic h:Lcom/android/launcher3/CellLayout;

.field final synthetic i:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/C2$l;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/C2$l;->g:Lcom/android/launcher3/widget/T;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/C2$l;->h:Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Lcom/android/launcher3/V3;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/C2$l;->i:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/C2;->Q0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/V3;->q:Lcom/android/launcher3/V3;

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/C2$l;->i:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/C2;->Q0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/V3;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/V3;->r:Lcom/android/launcher3/V3;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    :cond_0
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    if-ne p1, v0, :cond_1

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/C2$l;->g:Lcom/android/launcher3/widget/T;

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/C2$l;->h:Lcom/android/launcher3/CellLayout;

    .line 28
    .line 29
    invoke-static {p1, v0}, Lcom/android/launcher3/AppWidgetResizeFrame;->n0(Lcom/android/launcher3/widget/T;Lcom/android/launcher3/CellLayout;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/android/launcher3/C2$l;->i:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/C2;->R0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/statemanager/d;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1, p0}, Lcom/android/launcher3/statemanager/d;->b0(Lcom/android/launcher3/statemanager/d$g;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public bridge synthetic onStateTransitionComplete(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/C2$l;->a(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
