.class Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;
.super Lcom/android/quickstep/DisplayModel;
.source "TouchInteractionService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/TouchInteractionService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InputMonitorDisplayModel"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/quickstep/DisplayModel<",
        "Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/quickstep/TouchInteractionService;


# direct methods
.method private constructor <init>(Lcom/android/quickstep/TouchInteractionService;Landroid/content/Context;)V
    .locals 0

    .line 2
    iput-object p1, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;->this$0:Lcom/android/quickstep/TouchInteractionService;

    .line 3
    invoke-direct {p0, p2}, Lcom/android/quickstep/DisplayModel;-><init>(Landroid/content/Context;)V

    .line 4
    invoke-virtual {p0}, Lcom/android/quickstep/DisplayModel;->initializeDisplays()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/quickstep/TouchInteractionService;Landroid/content/Context;Lcom/android/quickstep/i7;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;-><init>(Lcom/android/quickstep/TouchInteractionService;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/DisplayModel$DisplayResource;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;->createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;

    move-result-object p0

    return-object p0
.end method

.method public createDisplayResource(Landroid/view/Display;)Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;
    .locals 2

    .line 2
    new-instance v0, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;

    iget-object p0, p0, Lcom/android/quickstep/TouchInteractionService$InputMonitorDisplayModel;->this$0:Lcom/android/quickstep/TouchInteractionService;

    invoke-virtual {p1}, Landroid/view/Display;->getDisplayId()I

    move-result p1

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/android/quickstep/TouchInteractionService$InputMonitorResource;-><init>(Lcom/android/quickstep/TouchInteractionService;ILcom/android/quickstep/i7;)V

    return-object v0
.end method
