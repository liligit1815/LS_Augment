.class public final synthetic Lcom/android/launcher3/testing/d;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/testing/d;->g:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/testing/d;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/testing/TestInformationHandler;->o(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
