.class public abstract Lcom/android/launcher3/taskbar/bubbles/u;
.super Ljava/lang/Object;
.source "BubbleBarItem.kt"


# instance fields
.field private final a:Ljava/lang/String;

.field private b:Lcom/android/launcher3/taskbar/bubbles/BubbleView;


# direct methods
.method private constructor <init>(Ljava/lang/String;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/bubbles/u;->a:Ljava/lang/String;

    iput-object p2, p0, Lcom/android/launcher3/taskbar/bubbles/u;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lcom/android/launcher3/taskbar/bubbles/BubbleView;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/bubbles/u;-><init>(Ljava/lang/String;Lcom/android/launcher3/taskbar/bubbles/BubbleView;)V

    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Lcom/android/launcher3/taskbar/bubbles/BubbleView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/bubbles/u;->b:Lcom/android/launcher3/taskbar/bubbles/BubbleView;

    .line 2
    .line 3
    return-object p0
.end method
