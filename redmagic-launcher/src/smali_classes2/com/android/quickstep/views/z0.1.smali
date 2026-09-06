.class public final synthetic Lcom/android/quickstep/views/z0;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:Lcom/android/quickstep/views/RecentsView;


# direct methods
.method public synthetic constructor <init>(Lcom/android/quickstep/views/RecentsView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/z0;->g:Lcom/android/quickstep/views/RecentsView;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/z0;->g:Lcom/android/quickstep/views/RecentsView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/quickstep/views/RecentsView;->g1(Lcom/android/quickstep/views/RecentsView;)Lcom/android/quickstep/recents/data/RecentsRotationStateRepository;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
