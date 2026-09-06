.class public final synthetic LP1/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lcom/android/launcher3/util/a2;


# instance fields
.field public final synthetic g:LP1/k;

.field public final synthetic h:Lcom/android/quickstep/SystemUiProxy;


# direct methods
.method public synthetic constructor <init>(LP1/k;Lcom/android/quickstep/SystemUiProxy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP1/j;->g:LP1/k;

    .line 5
    .line 6
    iput-object p2, p0, LP1/j;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 1

    .line 1
    iget-object v0, p0, LP1/j;->g:LP1/k;

    .line 2
    .line 3
    iget-object p0, p0, LP1/j;->h:Lcom/android/quickstep/SystemUiProxy;

    .line 4
    .line 5
    invoke-static {v0, p0}, LP1/k;->a(LP1/k;Lcom/android/quickstep/SystemUiProxy;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
