.class public Lcom/android/quickstep/BinderTracker$BinderCallSite;
.super Ljava/lang/Object;
.source "BinderTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/BinderTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BinderCallSite"
.end annotation


# instance fields
.field public final activeTrace:Ljava/lang/String;

.field public final descriptor:Ljava/lang/String;

.field public final stackTrace:Ljava/lang/String;

.field public final transactionCode:I


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/BinderTracker$BinderCallSite;->activeTrace:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/quickstep/BinderTracker$BinderCallSite;->descriptor:Ljava/lang/String;

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/BinderTracker$BinderCallSite;->transactionCode:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/android/quickstep/BinderTracker$BinderCallSite;->stackTrace:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method
